package com.qf.web.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

/**
 * @author : sin
 * @date : 2024/1/7 18:27
 * @Description : 字典值分页数据
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class DictPageVo {
    private Long id;
    private String name;
    private String typeCode;
    private Integer status;
    private String value;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
}