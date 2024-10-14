package controller;

import dto.LoginDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AdminAuthenticator;

/**
 *
 * @author rajes
 */
public class AdminLoginChecker extends HttpServlet 
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
        
        AdminAuthenticator l1 = new AdminAuthenticator();
        boolean login = l1.isLogin(user);
        
        if(login)
        {
            response.sendRedirect("adminHome.html");
        }
        else
            response.sendRedirect("adminLogin.html");
    }
    
}