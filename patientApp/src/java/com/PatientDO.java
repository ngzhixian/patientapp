package com;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Sean
 */
public class PatientDO {

   
    private String title;
    private String firstName;
    private String lastName;
    private String dob;
    private String gender;
    private String mobile;
    private String HomeNo;
    private Integer patientId;
    private String medicalFund;

    public String getTitle() {
        return title;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getDob() {
        return dob;
    }

    public String getGender() {
        return gender;
    }

    public String getMobile() {
        return mobile;
    }

    public String getHomeNo() {
        return HomeNo;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public String getMedicalFund() {
        return medicalFund;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setHomeNo(String HomeNo) {
        this.HomeNo = HomeNo;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public void setMedicalFund(String medicalFund) {
        this.medicalFund = medicalFund;
    }
    
    
    
    
}
