package com.qf.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qf.web.domain.entity.SysUser;
import com.qf.web.service.SysUserService;
import com.qf.web.mapper.SysUserMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

/**
* @author 清风
* @description 针对表【sys_user(用户信息表)】的数据库操作Service实现
* @createDate 2023-12-13 10:00:36
*/
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser>
    implements SysUserService{

    @Resource
    SysUserMapper sysUserMapper;

    @Override
    public SysUser selectByUsername(String username) {

        SysUser user = sysUserMapper.selectOne(new QueryWrapper<SysUser>().eq("username", username));
        System.out.println(user);
        return user;
    }
}




