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
@TableName("ems_answer")
@ApiModel(value="Answer对象", description="")
public class Answer implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "答案id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "试卷编号")
    private Integer paperId;

    @ApiModelProperty(value = "用户id")
    private String memberId;

    @ApiModelProperty(value = "题目编号")
    private Integer questionId;

    @ApiModelProperty(value = "1是单选2是多选3是判断4是填空5是简答")
    private String questionType;

    @ApiModelProperty(value = "答案")
    private String answer;

    @ApiModelProperty(value = "图片")
    private Integer number;

    @ApiModelProperty(value = "该题得分")
    private Integer score;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;
}
