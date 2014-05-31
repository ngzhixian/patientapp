package com;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author Sean
 */
public class ConnectionManager {
    Connection conn = null;
    String url;
    String driver;
    String userName;
    String password;

    public Connection mySqlConnection() {

        url = "jdbc:mysql://localhost:3306/patientApp";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";

        try {
            Class.forName(driver).newInstance();
            java.util.Properties connProperties = new java.util.Properties();
            connProperties.put("user", userName);
            connProperties.put("password", password);
            connProperties.put("characterEncoding", "UTF-8");

            conn = DriverManager.getConnection(url,connProperties);
            System.out.println("Connected.");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    
}

