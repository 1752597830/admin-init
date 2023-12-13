package com.qf.web.service;

import com.qf.web.domain.entity.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author 清风
* @description 针对表【sys_user(用户信息表)】的数据库操作Service
* @createDate 2023-12-13 10:00:36
*/
public interface SysUserService extends IService<SysUser> {

    SysUser selectByUsername(String username);
}
