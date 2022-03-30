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
 * @since 2020-08-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("ems_score_manage")
@ApiModel(value="ScoreManage对象", description="")
public class ScoreManage implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "成绩id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "考试编号")
    private String examId;

    @ApiModelProperty(value = "用户id")
    private String memberId;

    @ApiModelProperty(value = "课程id")
    private String courseId;

    @ApiModelProperty(value = "章节ID")
    private String chapterId;

    @ApiModelProperty(value = "考试的有效次数")
    private Integer number;

    @ApiModelProperty(value = "总成绩")
    private Integer examScore;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;


}
