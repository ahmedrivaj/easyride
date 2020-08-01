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
    
    public static Driver fromResultSet(ResultSet set) throws SQLException {
        PickCustomer pickcustomer = new PickCustomer();
        pickcustomer.setId(set.getInt("id"));
        pickcustomer.setUserId(set.getInt("userId"));
        pickcustomer.setDriverId(set.getInt("driverId"));
        pickcustomer.setStatus(Ride.RideStatus.rideStatusFromString(set.getString("status")));
        pickcustomer.setPickupLocationLongitude(set.getDouble("pickupLocationLongitude"));
        pickcustomer.setPickupLocationLatitude(set.getDouble("pickupLocationLatitiude"));
        pickcustomer.setDestinationLongitude(set.getDouble("destinationLongitude"));
        pickcustomer.setDestinationLatitude(set.getDouble("destinationLatitude"));
        pickcustomer.setFare(set.getDouble("fare"));
        pickcustomer.setRequestedTimestamp(set.getTimestamp("requestedTimestamp"));
        pickcustomer.setEndTimestamp(set.getTimestamp("endTimestamp"));
        pickcustomer.setDistance(set.getDouble("distance"));
        return pickcustomer;
    }
}
