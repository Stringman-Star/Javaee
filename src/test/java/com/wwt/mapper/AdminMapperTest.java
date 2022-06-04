package com.wwt.mapper;

import com.wwt.entity.Admin;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class AdminMapperTest {
    @Autowired
    private AdminMapper adminMapper;
    @Test
    public void login(){
        Admin admin=new Admin();
        admin.setAccount("admin");
        admin.setAdminPwd("202cb962ac59075b964b07152d234b70");
        System.out.println(admin);
        System.out.println(adminMapper.login(admin));
    }
    @Test
    public void update(){
        Admin admin=new Admin();
        admin.setAdminId(1);
        admin.setImgUrl("123");
        System.out.println(adminMapper.update(admin));
    }
    @Test
    public void list(){
        System.out.println(adminMapper.list());
    }
}