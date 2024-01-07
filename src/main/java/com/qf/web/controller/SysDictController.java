package com.qf.web.controller;

import com.qf.common.core.controller.BaseController;
import com.qf.common.core.page.PageResult;
import com.qf.common.utils.BaseResponse;
import com.qf.web.domain.dto.DictPage;
import com.qf.web.domain.dto.OptionsDto;
import com.qf.web.domain.vo.DictPageVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import com.qf.web.service.SysDictService;

import java.util.List;


/**
 * @author : sin
 * @date : 2023/12/16 21:08
 * @Description : 字典管理
 */
@RestController
@RequestMapping("/dict")
public class SysDictController extends BaseController {

    @Resource
    private SysDictService sysDictService;

    /**
     * 字典下拉列表
     *
     * @param typeCode 字典类型
     */
    @Operation(summary = "字典下拉列表")
    @GetMapping("/{typeCode}/options")
    public BaseResponse dictOptions(@Parameter(description = "字典类型编码") @PathVariable String typeCode) {
        List<OptionsDto> voList = sysDictService.dictOptions(typeCode);
        return BaseResponse.success(voList);
    }

    /**
     * @author: sin
     * @Description 根据code编码获取字典值
     */
    @GetMapping("/page")
    public BaseResponse getDictValuePage(DictPage dictPage){
        startPage();
        List<DictPageVo> list = sysDictService.dictValuePage(dictPage.getCode());
        System.out.println(list);
        PageResult pageResult = getData(list);
        System.out.println(pageResult);
        return BaseResponse.success(pageResult);
    }

    /**
     * @author: sin
     * @Description 字典类型列表
     */
    @GetMapping("/types/page")
    public BaseResponse dictTypes(){
        return BaseResponse.success(sysDictService.dictTypes());
    }
}