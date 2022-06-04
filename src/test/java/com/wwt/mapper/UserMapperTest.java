package com.wwt.mapper;

import com.wwt.entity.Film;
import com.wwt.entity.Users;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class UserMapperTest {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private FilmMapper filmMapper;
    @Autowired
    private FilmCategoryMapper filmCategoryMapper;
    @Autowired
    private PlayMapper playMapper;

    @Autowired
    private TicketMapper ticketMapper;
    @Test
    public void login(){
        Users users=new Users();
        users.setUserAccount("2068206886");
        users.setUserPassword("123456");
        System.out.println(userMapper.login(users));
    }
    @Test
    public void id(){
        System.out.println(filmMapper.film(1));
    }
    @Test
    public void iaa(){
        System.out.println(filmCategoryMapper.type(1));
    }
    @Test
    public void pp(){
        System.out.println(playMapper.playById(1));
    }
    @Test
    public void tt(){
        System.out.println(ticketMapper.playById(1));
    }
    @Test
    public void list(){
        List<Film> list=filmMapper.list();
        System.out.println(list);
    }
    @Test
    public void update(){
        Users users=new Users();
        users.setImgUrl("###");
        users.setUserId(1);
        System.out.println(userMapper.update(users));
    }
    @Test
    public void add(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date=new Date();
        String time=df.format(date);
        System.out.println(time);
        Users users=new Users();
        users.setImgUrl("***");
        users.setSex(1);
        users.setUserPassword("123456");
        users.setUserAccount("206886");
        users.setUserName("隔壁老王");
        users.setCreateTime(time);
        users.setUpdateTime(time);
        users.setLastIp("129.12.12.12");
        users.setUserEmli("123@qq.com");
        users.setUserPhone("15019999999");
        System.out.println(users);
        System.out.println(userMapper.add(users));

    }

}