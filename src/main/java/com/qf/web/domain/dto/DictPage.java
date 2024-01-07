package com.qf.web.domain.dto;

import com.qf.common.core.page.PageDomain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

/**
 * @author : sin
 * @date : 2024/1/7 21:47
 * @Description :
 */
@Data
@AllArgsConstructor
@ToString
public class DictPage extends PageDomain {
    private String code;
}