package com.qf.web.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author : sin
 * @date : 2024/1/7 18:05
 * @Description :
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class DictTypeVo {
    private Long id;
    private String code;
    private String name;
}