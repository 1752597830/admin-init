package com.qf.monitor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

/**
 * @author : sin
 * @date : 2024/1/9 21:31
 * @Description :
 */
@Data
@AllArgsConstructor
@ToString
public class SeverVo {
    private String name;
    private String value;
}