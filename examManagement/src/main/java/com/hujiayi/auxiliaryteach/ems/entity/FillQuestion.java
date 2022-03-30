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
@TableName("ems_fill_question")
@ApiModel(value="FillQuestion对象", description="")
public class FillQuestion implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "试题ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "二级学科ID")
    private String subjectId;

    @ApiModelProperty(value = "一级学科ID")
    private String subjectParentId;

    @ApiModelProperty(value = "填空题目")
    private String question;

    @ApiModelProperty(value = "填空类型值为4")
    private String questionType;

    @ApiModelProperty(value = "正确答案")
    private String answer;

    @ApiModelProperty(value = "分数")
    private Integer score;

    @ApiModelProperty(value = "解析")
    private String analysis;

    @ApiModelProperty(value = "难度级别")
    private Integer level;

    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty(value = "更新时间")
    private Date gmtModified;


}
