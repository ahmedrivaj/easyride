/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.easyride.dao;

import static com.easyride.dao.BaseDao.getConnection;
import com.easyride.models.NotifyDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Ahmed Rivaj
 */
public class NotifyDriverDao {
    
    public static void main (String args[]) throws Exception
    {
        System.out.println("hello");
//        NotifyDriverDao cust = new NotifyDriverDao();
//        System.out.println(cust.getCallOfCustomer());
    }
    
    public static ArrayList<NotifyDriver> getCallOfCustomer() throws Exception {
        try {
            Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement("SELECT rides.userid, users.name from RIDES left join USERS on rides.userid = users.id WHERE rides.status = 'Waiting' FETCH FIRST 1 ROW ONLY");
            ResultSet result = statement.executeQuery();
            
            ArrayList<NotifyDriver> notifies = new ArrayList<>();
            while(result.next()){
                NotifyDriver notify = new NotifyDriver();
                notify.setUserId(result.getInt("userid"));
                notify.setName(result.getString("name"));
                notifies.add(notify);
            }
            
            return notifies;
//            statement.setInt(1, notify.getUserId());
//            statement.setString(2, notify.getName());
//            ResultSet set = statement.executeQuery();
//
//            if (!set.next()) {
//                return null;
//            }
//
//            return NotifyDriver.fromResultSet(set);
        } catch (Exception e) {System.out.println(e);}
        return null;
    }
}
