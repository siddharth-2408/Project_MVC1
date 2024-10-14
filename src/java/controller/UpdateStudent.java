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
import model.StudentAuthenticator;

/**
 *
 * @author rajes
 */
public class UpdateStudent extends HttpServlet 
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        response.sendRedirect("updatefaculty.jsp");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        String studentID = request.getParameter("student_id");
        String studentName = request.getParameter("student_name");
        String studentAddress = request.getParameter("student_add");
        String studentContact = request.getParameter("student_contact");
        String studentCity = request.getParameter("student_city");
        String studentDept = request.getParameter("student_dept");
        //System.out.println(facultyID +" "+facultyName+" "+facultyCity+" "+facultyAddress+" "+facultyContact+" "+facultyDept);
        if(studentName.trim().equals("") | studentAddress.trim().equals("") | studentContact.trim().equals("") | studentCity.trim().equals("") | studentDept.trim().equals(""))
        //if(studentName.equals("") | studentAddress.equals("") | studentContact.equals("") | studentCity.equals("") | studentDept.equals(""))
        {
            response.sendRedirect("adminHome.html");
        }
        else
        {
            AdminDTO fdto = new AdminDTO();
            fdto.setId(studentID);
            fdto.setName(studentName);
            fdto.setAddress(studentAddress);
            fdto.setContact(studentContact);
            fdto.setCity(studentCity);
            fdto.setDept(studentDept);

            StudentAuthenticator fa = new StudentAuthenticator();
            boolean update = fa.updateStudent(fdto);

            if(update)
            {
                response.sendRedirect("updatestudent.jsp");
            }
            else
            {
                response.sendRedirect("adminHome.html");
            }
        }
    }
}
