package com.hujiayi.auxiliaryteach.common.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class XliException extends RuntimeException {
	
	private Integer code;
	private String msg;
}
