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
    
    public static NotifyDriver fromResultSet(ResultSet set) throws SQLException {
        NotifyDriver notifydriver = new NotifyDriver();
        notifydriver.setId(set.getInt("id"));
        notifydriver.setUserId(set.getInt("userId"));
        notifydriver.setDriverId(set.getInt("driverId"));
        notifydriver.setStatus(Ride.RideStatus.rideStatusFromString(set.getString("status")));
        notifydriver.setPickupLocationLongitude(set.getDouble("pickupLocationLongitude"));
        notifydriver.setPickupLocationLatitude(set.getDouble("pickupLocationLatitiude"));
        notifydriver.setDestinationLongitude(set.getDouble("destinationLongitude"));
        notifydriver.setDestinationLatitude(set.getDouble("destinationLatitude"));
        notifydriver.setFare(set.getDouble("fare"));
        notifydriver.setRequestedTimestamp(set.getTimestamp("requestedTimestamp"));
        notifydriver.setEndTimestamp(set.getTimestamp("endTimestamp"));
        notifydriver.setDistance(set.getDouble("distance"));
        return notifydriver;
    }
    
}
