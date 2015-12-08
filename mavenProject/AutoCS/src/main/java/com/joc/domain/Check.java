package com.joc.domain;

import javax.persistence.*;

@Entity
@Table(name = "check")
public class Check extends BaseDomain {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private int cheId;

    @Column(name = "situation")
    private int situation;    //审核状态

    @Column(name = "periodid")
    private int periodId;     //学期标号

    @Column(name = "major")
    private String major;

    @Column(updatable = false)
    public int getCheId() {
        return cheId;
    }

    public void setCheId(int checkId) {
        this.cheId = checkId;
    }

    public int getSituation() {
        return situation;
    }

    public void setSituation(int situation) {
        this.situation = situation;
    }

    public int getPeriodId() {
        return periodId;
    }

    public void setPeriodId(int periodId) {
        this.periodId = periodId;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

}
