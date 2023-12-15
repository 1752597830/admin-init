package com.qf.web.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

/**
 * @author : sin
 * @date : 2023/12/15 17:19
 * @Description : 封装返回用户信息
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserVo {
    /*用户id*/
    private Long userId;

    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 用户角色列表
     */
    private List<String> roles;

    /**
     * 用户权限列表
     */
    private List<String> perms;

}