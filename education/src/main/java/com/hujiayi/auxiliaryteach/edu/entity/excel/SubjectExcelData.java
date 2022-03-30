package com.hujiayi.auxiliaryteach.edu.entity.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

@Data
public class SubjectExcelData {

    @ExcelProperty(index = 0)
    private String oneLevelSubjectName;

    @ExcelProperty(index = 1)
    private String twoLevelSubjectName;

}
