package com.qf.web.controller;

import com.qf.common.utils.BaseResponse;
import com.qf.common.utils.ToolUtils;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @author : sin
 * @date : 2023/12/13 12:54
 * @Description :
 */

@RestController
@Tag(name = "用户接口")
public class SysUserController {

    /**
     * 获取验证码
     */

    @GetMapping("/auth/captcha")
    public BaseResponse getCaptcha() {
        Map<String, String> map = ToolUtils.GenerateVerifyCode();
        return BaseResponse.success(map);
    }
}