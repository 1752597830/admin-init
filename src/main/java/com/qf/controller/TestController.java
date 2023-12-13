package com.qf.controller;

import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : sin
 * @date : 2023/12/13 9:20
 * @Description :
 */
@RestController
@Tag(name = "测试")
public class TestController {
    @GetMapping("/test")
    public String test() {
        return "test";
    }
}