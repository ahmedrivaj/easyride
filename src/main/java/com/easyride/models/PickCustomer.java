package com.easyride.models;

import com.easyride.utils.Hasher;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ahmed Rivaj
 */
public class PickCustomer {
    
    private int driverId;
    
    public static PickCustomer fromResultSet(ResultSet set) throws SQLException {
        PickCustomer pickcustomer = new PickCustomer();
        pickcustomer.setDriverId(set.getInt("driverId"));
        return pickcustomer;
    }
    
    public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }
}
