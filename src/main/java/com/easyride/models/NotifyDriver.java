/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.easyride.models;

import com.easyride.utils.Hasher;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Ahmed Rivaj
 */
public class NotifyDriver {
    
    private int userId;
    private String name;
    private String contactNumber;
    
//    public static NotifyDriver fromResultSet(ResultSet set) throws SQLException {
//        NotifyDriver notifydriver = new NotifyDriver();
//        notifydriver.setUserId(set.getInt("userId"));
//        notifydriver.setName(set.getString("name"));
//        notifydriver.setUserId(set.getInt("contactNumber"));
//        return notifydriver;
//    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }
    
}
