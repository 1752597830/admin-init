package com.qf.web.mapper;

import com.qf.web.domain.entity.SysUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
* @author 清风
* @description 针对表【sys_user(用户信息表)】的数据库操作Mapper
* @createDate 2023-12-13 10:00:36
* @Entity com.qf.web.domain.entity.SysUser
*/
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

}




