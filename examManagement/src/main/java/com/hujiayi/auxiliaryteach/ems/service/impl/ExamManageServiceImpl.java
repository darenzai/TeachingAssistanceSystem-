package com.hujiayi.auxiliaryteach.ems.service.impl;

import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.ems.controller.PaperManageController;
import com.hujiayi.auxiliaryteach.ems.entity.ExamManage;
import com.hujiayi.auxiliaryteach.ems.entity.PaperManage;
import com.hujiayi.auxiliaryteach.ems.mapper.ExamManageMapper;
import com.hujiayi.auxiliaryteach.ems.service.ExamManageService;
import com.hujiayi.auxiliaryteach.ems.service.PaperManageService;
import com.hujiayi.auxiliaryteach.ems.vo.ExamQueryVo;
import com.hujiayi.auxiliaryteach.ems.vo.ExamVo;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionListVo;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-08-06
 */
@Service
public class ExamManageServiceImpl extends ServiceImpl<ExamManageMapper, ExamManage> implements ExamManageService {

    @Autowired
    private PaperManageService paperManageService;

    @Autowired
    private PaperManageController paperManageController;

    // 根据查询条件, 进行分页多条件查询
    @Override
    public Map<String, Object> getExamListByConditionPage(ExamQueryVo examQueryVo, Long current, Long size) {

        // 1. 首先创建一个page
        Page<ExamManage> page = new Page<>(current, size);

        // 2. 获取查询条件数据
        String courseId = examQueryVo.getCourseId();
        String teacherId = examQueryVo.getTeacherId();
        String title = examQueryVo.getTitle();
        Date begin = examQueryVo.getBegin();
        Date end = examQueryVo.getEnd();

        // 3. 效验数据, 拼接条件
        QueryWrapper<ExamManage> wrapper = new QueryWrapper<>();

        if(!StringUtils.isEmpty(courseId)) {
            wrapper.eq("course_id", courseId);
        }
        if(!StringUtils.isEmpty(teacherId)) {
            wrapper.eq("teacher_id", teacherId);
        }
        if(!StringUtils.isEmpty(title)) {
            wrapper.or().like("title", title);
        }
        if(begin != null) {
            wrapper.ge("gmt_create", begin);
        }
        if(end != null) {
            wrapper.le("gmt_create", end);
        }

        wrapper.orderByDesc("gmt_create");

        // 3. 进行查询
        IPage<ExamManage> pages = this.page(page, wrapper);

        long total = pages.getTotal();
        List<ExamManage> records = pages.getRecords();

        Map<String, Object> map = new HashMap<>(16);
        map.put("total", total);
        map.put("recodes", records);

        return map;
    }

    // 2. 根据key来查询考试标题
    @Override
    public List<Map<String, Object>> getExamTitleListByKey(String key) {
        QueryWrapper<ExamManage> wrapper = new QueryWrapper<>();
        wrapper.select("title");
        wrapper.likeRight("title", key);
        List<Map<String, Object>> maps = this.baseMapper.selectMaps(wrapper);
        return maps;
    }

    @Override
    public void insertExam(ExamVo examVo) {

        PaperManage onePaperManage = new PaperManage();
        onePaperManage.setParentId(0);
        onePaperManage.setLevel(1);
        paperManageService.save(onePaperManage);

        insert(examVo.getTitleItems(), onePaperManage.getId());

        ExamManage examManage = new ExamManage();
        BeanUtils.copyProperties(examVo, examManage);
        examManage.setPaperId(onePaperManage.getId());
        this.save(examManage);
    }

    @Override
    public void updateExam(ExamVo examVo) {

        ExamManage oldExamManage = this.getById(examVo.getId());
        if(oldExamManage == null) {
            throw new XliException(20001, "获取数据异常o(╥﹏╥)o");
        }
        BeanUtils.copyProperties(examVo, oldExamManage);
        this.updateById(oldExamManage);

        // 2. 先删除之前的数据, 然后再更新
        Integer paperId = oldExamManage.getPaperId();

        // 3. 删除数据
        QueryWrapper<PaperManage> twoWrapper = new QueryWrapper<>();
        twoWrapper.eq("parent_id", paperId);
        List<PaperManage> twoPaperManager = paperManageService.list(twoWrapper);
        twoPaperManager.forEach(item -> {
            Integer id = item.getId();
            QueryWrapper<PaperManage> threeWrapper = new QueryWrapper<>();
            threeWrapper.eq("parent_id", id);
            paperManageService.remove(threeWrapper);
            paperManageService.removeById(id);
        });

        // 4. 插入数据,
        insert(examVo.getTitleItems(), paperId);
    }


    @Override
    public ExamVo select(String id) {
        ExamManage examManage = this.getById(id);

        if(examManage == null) {
            throw new XliException(20001, "系统异常o(╥﹏╥)o");
        }

        ExamVo examVo = new ExamVo();
        BeanUtils.copyProperties(examManage, examVo);

        List<QuestionListVo> titleItems = new ArrayList<>();

        QueryWrapper<PaperManage> twoWrapper = new QueryWrapper<>();
        twoWrapper.eq("parent_id", examManage.getPaperId());
        List<PaperManage> twoPaperManager = paperManageService.list(twoWrapper);

        System.out.println("twoPaperManager:" + twoPaperManager);

        twoPaperManager.forEach(item -> {
            List<QuestionVo> questionItems = new ArrayList<>();
            QuestionListVo questionListVo = new QuestionListVo();
            questionListVo.setName(item.getName());

            QueryWrapper<PaperManage> threeWrapper = new QueryWrapper<>();
            threeWrapper.eq("parent_id", item.getId());
            List<PaperManage> threePaperManager = paperManageService.list(threeWrapper);
            System.out.println("threePaperManager:" + threePaperManager);
            threePaperManager.forEach(question -> {
                R r = paperManageController.select(question.getQuestionType(), question.getQuestionId());
                QuestionVo questionVo = (QuestionVo)r.getData().get("questionVo");
                System.out.println("questionVo:" + questionVo);
                questionItems.add(questionVo);
            });
            questionListVo.setQuestionItems(questionItems);
            System.out.println("questionListVo:" + questionListVo);
            titleItems.add(questionListVo);
        });
        examVo.setTitleItems(titleItems);
        return examVo;
    }

    public void insert(List<QuestionListVo> titleItems, Integer paperId) {
        titleItems.forEach(item -> {
            PaperManage twoPaperManager = new PaperManage();
            if(!StringUtils.isEmpty(item.getName())) {
                Integer parentId = paperId;
                twoPaperManager.setParentId(parentId);
                twoPaperManager.setLevel(2);
                twoPaperManager.setName(item.getName());
                paperManageService.save(twoPaperManager);
            }else {
                throw new XliException(20001, "请输入标题o(╥﹏╥)o");
            }

            if(item.getQuestionItems()!=null && item.getQuestionItems().size() > 0) {
                item.getQuestionItems().forEach(question -> {
                    PaperManage threePaperManager = new PaperManage();
                    threePaperManager.setParentId(twoPaperManager.getId());
                    threePaperManager.setLevel(3);
                    threePaperManager.setQuestionType(question.getQuestionType());
                    threePaperManager.setQuestionId(question.getId());
                    paperManageService.save(threePaperManager);
                });
            }
        });
    }

}
