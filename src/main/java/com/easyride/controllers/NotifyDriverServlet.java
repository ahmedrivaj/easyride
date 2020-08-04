/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.easyride.controllers;

import com.easyride.dao.NotifyDriverDao;
import com.easyride.dao.UserDao;
import com.easyride.models.NotifyDriver;
import com.easyride.utils.EasyCabSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ahmed Rivaj
 */
@WebServlet(name = "NotifyDriverServlet", urlPatterns = {"/driver/notifydriver"})
public class NotifyDriverServlet extends BaseServlet{
    
    private ArrayList<NotifyDriver> notifydriversList = null;
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String newStatus = request.getParameter("driverStatus");
//        User.DriverStatus status = User.DriverStatus.driverStatusFromString(newStatus);
//        EasyCabSession session = getSession(request);
//        User driver = session.getUser();
//        if (status != null){
//            driver.setDriverStatus(status);
//            UserDao.setDriverStatus(driver, status);
//            
//        }
//        response.sendRedirect("/driver/dashboard.jsp");
    }
    
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
//        System.out.println("test");
//        System.out.println(notify.getCallOfCustomer());
        try{
//            NotifyDriverDao notify = new NotifyDriverDao();
//            notifydriversList = notify.getCallOfCustomer();
            Integer ball = UserDao.getAvailableDriverCount();
            notifydriversList = NotifyDriverDao.getCallOfCustomer();
//            PrintWriter out = response.getWriter();
//            out.println(notifydriversList);
//            out.println("test");
////        
////        System.out.println(notifydriversList);
        String UserName = null;  
        Integer UserId = null;
        for (NotifyDriver noti: notifydriversList){
            UserId = noti.getUserId();
            UserName = noti.getName();
        }
        
        request.setAttribute("UserId", UserId);
        request.setAttribute("UserName", UserName);
        request.setAttribute("mouse", notifydriversList);
        request.setAttribute("ball",ball);
        getServletContext().getRequestDispatcher("/driver/notify-driver.jsp").forward(request, response);
//        response.sendRedirect("/driver/notify-driver.jsp");
            
        }catch(Exception e){
                
            }
        
//
//        
    }
    
}
