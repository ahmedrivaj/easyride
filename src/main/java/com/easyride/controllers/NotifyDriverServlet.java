/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.easyride.controllers;

import com.easyride.dao.UserDao;
import com.easyride.models.User;
import com.easyride.utils.EasyCabSession;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ahmed Rivaj
 */
@WebServlet(name = "SetDriverStatusServlet", urlPatterns = {"/driver/notifydriver"})
public class NotifyDriverServlet {
    
}
