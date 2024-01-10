package com.qf.web.controller;

import com.qf.common.constant.CacheConstants;
import com.qf.common.utils.BaseResponse;
import com.qf.common.utils.RedisCache;
import com.qf.common.utils.SysCache;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * @author : sin
 * @date : 2024/1/10 14:59
 * @Description : 获取缓存信息
 */
@RestController
@RequestMapping("/monitor/cache")
public class CoachController {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Resource
    RedisCache redisCache;

    private final static List<SysCache> caches = new ArrayList<SysCache>();

    {
        caches.add(new SysCache(CacheConstants.LOGIN_TOKEN_KEY, "用户信息"));
        caches.add(new SysCache(CacheConstants.SYS_CONFIG_KEY, "配置信息"));
        caches.add(new SysCache(CacheConstants.SYS_DICT_KEY, "数据字典"));
        caches.add(new SysCache(CacheConstants.CAPTCHA_CODE_KEY.substring(0, CacheConstants.CAPTCHA_CODE_KEY.length() - 1), "验证码"));
        caches.add(new SysCache(CacheConstants.REPEAT_SUBMIT_KEY, "防重提交"));
        caches.add(new SysCache(CacheConstants.RATE_LIMIT_KEY, "限流处理"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码错误次数"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码1错误次数"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码2错误次数"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码3错误次数"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码4错误次数"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码5错误次数"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码6错误次数"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码7错误次数"));
    }

    @GetMapping("/getNames")
    public BaseResponse getCacheInfo() {
        return BaseResponse.success(caches);
    }

    @GetMapping("/getKeys/{cacheName}")
    public BaseResponse getCacheKeys(@PathVariable String cacheName) {
        Set<String> cacheKeys = redisTemplate.keys(cacheName + "*");
        List<Map<String, String>> list = new ArrayList<>();
        if (cacheKeys != null) {
            cacheKeys.forEach(key -> {
                Map<String, String> map = new HashMap<>();
                map.put("v", key);
                list.add(map);
            });
        }
        System.out.println(cacheKeys);
        return BaseResponse.success(list);
    }

    @GetMapping("/getValue/{cacheName}/{cacheKey}")
    public BaseResponse getCacheValue(@PathVariable String cacheName, @PathVariable String cacheKey) {
        String cacheValue = redisTemplate.opsForValue().get(cacheKey);
        SysCache sysCache = new SysCache(cacheName, cacheKey, cacheValue);
        System.out.println(sysCache);
        return BaseResponse.success(sysCache);
    }

    @DeleteMapping("/clearCacheName/{cacheName}")
    public BaseResponse clearCacheName(@PathVariable String cacheName) {
        Collection<String> cacheKeys = redisTemplate.keys(cacheName + "*");
        redisTemplate.delete(cacheKeys);
        return BaseResponse.success();
    }

    @DeleteMapping("/clearCacheKey/{cacheKey}")
    public BaseResponse clearCacheKey(@PathVariable String cacheKey) {
        redisTemplate.delete(cacheKey);
        return BaseResponse.success();
    }

    @DeleteMapping("/clearCacheAll")
    public BaseResponse clearCacheAll() {
        Collection<String> cacheKeys = redisTemplate.keys("*");
        redisTemplate.delete(cacheKeys);
        return BaseResponse.success();
    }
}