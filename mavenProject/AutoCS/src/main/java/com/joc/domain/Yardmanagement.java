package com.joc.domain;

import javax.persistence.*;

@Entity
@Table(name = "yardmanagement")          //院负责人表
public class Yardmanagement extends BaseDomain{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private int yardId;

    @Column(name = "user_name")
    private String yardUserName;

    @Column(name = "password")
    private String yardPassword;

    @Column(name = "name")
    private String yardName;

    @Column(name = "telephone")
    private String yardTelephone;

    @Column(updatable = false)
    public int getYardId() {
        return yardId;
    }

    public void setYardId(int yardId) {
        this.yardId = yardId;
    }

    public String getYardUserName() { return yardUserName; }

    public void setYardUserName(String yardUserName) {
        this.yardUserName = yardUserName;
    }

    public String getYardPassword() {
        return yardPassword;
    }

    public void setYardPassword(String yardPassword) {
        this.yardPassword = yardPassword;
    }

    public String getYardName() {
        return yardName;
    }

    public void setYardName(String yardName) {
        this.yardName = yardName;
    }

    public String getYardTelephone() {
        return yardTelephone;
    }

    public void setYardTelephone(String yardTelephone) {
        this.yardTelephone = yardTelephone;
    }

}
