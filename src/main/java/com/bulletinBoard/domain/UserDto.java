package com.bulletinBoard.domain;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.text.ParseException;

public class UserDto {
    // 아이디
    private String id;
    // 비밀번호
    private String pwd;
    // 이름
    private String name;
    // 이메일
    private String email;
    // 생년월일
    private Date birth;
    // 휴대폰 번호
    private String phone_number;
    // 등록일
    private Date reg_date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public UserDto() {}

    public UserDto(String id, String pwd, String name, String email, String birth, String phone_number) throws ParseException {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.phone_number = phone_number;
        this.email = email;
        // SimpleDateFormat 으로 형식 만들어주고,
        SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
        // util.Date 형식에 format.parse(birth) 변환해서 넣어준다.
        java.util.Date date = format.parse(birth);
        // getTime(): second로 변환되어 반환
        // sql.Date 자료형으로 date.getTime()해서 넣어준다.
        this.birth = new java.sql.Date(date.getTime());
    }

    public UserDto(String id, String pwd, String name, String email, Date birth, String phone_number, Date reg_date) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.birth = birth;
        this.phone_number = phone_number;
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "id='" + id + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", birth=" + birth +
                ", phone_number='" + phone_number + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }
}
