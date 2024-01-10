package com.qf.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.qf.common.utils.BaseResponse;
import com.qf.monitor.SeverVo;
import com.qf.server.Cpu;
import com.qf.server.Server;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author : sin
 * @date : 2024/1/9 21:46
 * @Description :
 */
@RestController
@RequestMapping("/sever")
public class SeverController {

    @GetMapping("/a")
    public BaseResponse cpu() throws Exception {
        Server server = new Server();
        server.copyTo();
        return BaseResponse.success(server);
    }
}