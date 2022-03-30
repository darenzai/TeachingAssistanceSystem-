package com.hujiayi.auxiliaryteach.ems.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author andy
 * @since 2020-08-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("ems_exam_manage")
@ApiModel(value="ExamManage对象", description="")
public class ExamManage implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "考试id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "出卷老师ID")
    private String teacherId;

    @ApiModelProperty(value = "试卷id")
    private Integer paperId;

    @ApiModelProperty(value = "如果是1表示是期中或者期末考试，如果是2表示是一个章节的测试")
    private Integer type;

    @ApiModelProperty(value = "课程ID")
    private String courseId;

    @ApiModelProperty(value = "章节ID")
    private String chapterId;

    @ApiModelProperty(value = "考试总分")
    private Integer totalScore;

    @ApiModelProperty(value = "考试时长")
    private Integer totalTime;

    @TableLogic
    @ApiModelProperty(value = "逻辑删除 1（true）已删除， 0（false）未删除")
    private Integer isDeleted;

    @ApiModelProperty(value = "试卷截止时间")
    private Date stopTime;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;


}
