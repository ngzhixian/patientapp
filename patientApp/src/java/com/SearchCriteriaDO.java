/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

/**
 *
 * @author Sean
 */
public class SearchCriteriaDO {
    private String firstName;
    private String lastName;
    private String patientId;
    private String unitNo;
    private String streetNo;
    private String street;
    private String streetType;
    private String suburb;
    private String postcode;
    private String state;
    private String mobile;
    private Integer searchOption;

    public Integer getSearchOption() {
        return searchOption;
    }

    public void setSearchOption(Integer searchOption) {
        this.searchOption = searchOption;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMobile() {
        return mobile;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPatientId() {
        return patientId;
    }

    public String getUnitNo() {
        return unitNo;
    }

    public String getStreetNo() {
        return streetNo;
    }

    public String getStreet() {
        return street;
    }

    public String getStreetType() {
        return streetType;
    }

    public String getSuburb() {
        return suburb;
    }

    public String getPostcode() {
        return postcode;
    }

    public String getState() {
        return state;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public void setUnitNo(String unitNo) {
        this.unitNo = unitNo;
    }

    public void setStreetNo(String streetNo) {
        this.streetNo = streetNo;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public void setStreetType(String streetType) {
        this.streetType = streetType;
    }

    public void setSuburb(String suburb) {
        this.suburb = suburb;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public void setState(String state) {
        this.state = state;
    }

    
    
}
