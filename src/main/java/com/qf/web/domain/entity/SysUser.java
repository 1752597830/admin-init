package com.qf.web.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

/**
 * @TableName sys_user
 */
@TableName(value = "sys_user")
@Data
public class SysUser implements Serializable, UserDetails {
    /**
     * 用户的ID
     */
    private Long id;

    /**
     * 用户的用户名
     */
    private String username;

    /**
     * 用户的昵称
     */
    private String nickname;

    /**
     * 用户的性别
     */
    private Integer gender;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户的头像
     */
    private String avatar;

    /**
     * 用户的手机号码
     */
    private String mobile;

    /**
     * 用户的状态 0:正常;1:禁用
     */
    private Integer status;

    /**
     * 用户的邮箱
     */
    private String email;

    /**
     * 用户是否被删除 0:未删除;1:已删除
     */
    private Integer deleted;

    /**
     * 用户创建的时间
     */
    private Date createTime;

    /**
     * 用户最后更新的时间
     */
    private Date updateTime;

    /**
     * 用户创建的账号
     */
    private String createBy;

    /**
     * 用户最后更新的账号
     */
    private String updateBy;

    /**
     * 序列化版本UID
     */
    private static final long serialVersionUID = 1L;

    /**
     * 获取用户所具有的权限
     *
     * @return 返回用户所具有的权限列表，如果没有权限则返回null
     */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }


    /**
     * 判断账户是否非过期
     *
     * @return 如果账户过期返回false，否则返回true
     */
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }


    /**
     * 判断账户是否被锁定
     *
     * @return 如果账户被锁定返回true，否则返回false
     */
    @Override
    public boolean isAccountNonLocked() {
        return this.status == 0 ? true : false;
    }


    /**
     * 判断密码是否过期
     *
     * @return 如果密码过期返回true，否则返回false
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }


    /**
     * 判断当前对象是否启用
     *
     * @return 如果当前对象启用，返回true；否则返回false
     */
    @Override
    public boolean isEnabled() {
        return this.status == 0 ? true : false;
    }

}