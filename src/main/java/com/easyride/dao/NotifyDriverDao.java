/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.easyride.dao;

import static com.easyride.dao.BaseDao.getConnection;
import com.easyride.models.Ride;
import com.easyride.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Ahmed Rivaj
 */
public class NotifyDriverDao {
    
    public static Ride getCallOfCustomer(User driver) {
        try {
            Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement("SELECT id, userId, driverId, status, pickupLocationLongitude, pickupLocationLatitude, destinationLongitude, destinationLatitude, fare, requestedTimestamp, endTimestamp, distance from rides where driverId = 3 AND status='Waiting'");
            statement.setInt(1, driver.getId());
            ResultSet set = statement.executeQuery();

            if (!set.next()) {
                return null;
            }

            return Ride.fromResultSet(set);
        } catch (SQLException ex) {
            return null;
        }
    }
}
