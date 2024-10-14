/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.AdminDTO;
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
public class UpdateFaculty extends HttpServlet 
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        response.sendRedirect("updatefaculty.jsp");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        String facultyID = request.getParameter("facultyid");
        String facultyName = request.getParameter("facultyname");
        String facultyAddress = request.getParameter("facultyadd");
        String facultyContact = request.getParameter("facultycontact");
        String facultyCity = request.getParameter("facultycity");
        String facultyDept = request.getParameter("facultydept");
        //System.out.println(facultyID +" "+facultyName+" "+facultyCity+" "+facultyAddress+" "+facultyContact+" "+facultyDept);
        if(facultyName.trim().equals("") | facultyAddress.trim().equals("") | facultyContact.trim().equals("") | facultyCity.trim().equals("") | facultyDept.trim().equals(""))
        //if(studentName.equals("") | studentAddress.equals("") | studentContact.equals("") | studentCity.equals("") | studentDept.equals(""))
        {
            response.sendRedirect("adminHome.html");
        }
        else
        {
            AdminDTO fdto = new AdminDTO();
            fdto.setId(facultyID);
            fdto.setName(facultyName);
            fdto.setAddress(facultyAddress);
            fdto.setContact(facultyContact);
            fdto.setCity(facultyCity);
            fdto.setDept(facultyDept);

            FacultyAuthenticator fa = new FacultyAuthenticator();
            boolean update = fa.updateFaculty(fdto);

            if(update)
            {
                response.sendRedirect("updatefaculty.jsp");
            }
            else
            {
                response.sendRedirect("adminHome.html");
            }
        }    
    }
}
