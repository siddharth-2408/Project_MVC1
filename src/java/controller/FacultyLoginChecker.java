/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.LoginDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FacultyAuthenticator;

/**
 *
 * @author rajes
 */
public class FacultyLoginChecker extends HttpServlet 
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("OpeningPage.html");
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {    
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        
        LoginDTO user = new LoginDTO();
        user.setUsername(username);
        user.setPassword(password);
        
        FacultyAuthenticator l1 = new FacultyAuthenticator();
        boolean login = l1.isLogin(user);
        
        if(login)
        {
            if(user.getRole().equalsIgnoreCase("faculty"))
            {
                response.sendRedirect("facultyHome.html");
            }
            else
            {
                response.sendRedirect("hodHome.html");
            }
        }
        else
            response.sendRedirect("facultylogin.html");
    }
}
