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
@TableName("ems_paper_manage")
@ApiModel(value="PaperManage对象", description="")
public class PaperManage implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "试卷id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "0表示为父试卷，其他表示为是该试卷的子题目")
    private Integer parentId;

    @ApiModelProperty(value = "级别，为1表示是一个总的试卷，为2表示是试卷下的一个标题，为3表示是标题下的题目")
    private Integer level;

    @ApiModelProperty(value = "标题")
    private String name;

    @ApiModelProperty(value = "题目类型,0选择，1多选题，2为判断，3为填空，4为简答。")
    private String questionType;

    @ApiModelProperty(value = "题目id")
    private Integer questionId;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;


}
