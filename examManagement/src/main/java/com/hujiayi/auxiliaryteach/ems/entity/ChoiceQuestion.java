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
 * @since 2020-08-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("ems_choice_question")
@ApiModel(value="ChoiceQuestion对象", description="")
public class ChoiceQuestion implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "试题ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "二级学科id")
    private String subjectId;

    @ApiModelProperty(value = "一级学科id")
    private String subjectParentId;

    @ApiModelProperty(value = "问题题目")
    private String question;

    @ApiModelProperty(value = "选项A")
    private String answerA;

    @ApiModelProperty(value = "选项B")
    private String answerB;

    @ApiModelProperty(value = "选项C")
    private String answerC;

    @ApiModelProperty(value = "选项D")
    private String answerD;

    @ApiModelProperty(value = "正确答案")
    private String rightKey;

    @ApiModelProperty(value = "分数")
    private Integer score;

    @ApiModelProperty(value = "类型1为选择题, 2为多选题")
    private String questionType;

    @ApiModelProperty(value = "题目解析")
    private String analysis;

    @ApiModelProperty(value = "难度级别")
    private Integer level;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty(value = "更新时间")
    private Date gmtModified;

}
