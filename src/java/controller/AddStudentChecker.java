package controller;

import dto.AdminDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FacultyAuthenticator;

/**
 *
 * @author rajes
 */
public class AddStudentChecker extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("adminHome.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String fid = request.getParameter("student_id");
        String fname = request.getParameter("student_name");
        String fdept = request.getParameter("student_dept");
        String fcontact = request.getParameter("student_contact");
        String fcity = request.getParameter("student_city");
        String faddress = request.getParameter("student_address");
        String fpassword = request.getParameter("student_password");
        
        if(fname.trim().equals("")||fpassword.equals("")||fcity.equals("")||fid.equals(""))
        {
            response.sendRedirect("addstudent2.jsp");
        }
        else
        {
            AdminDTO dto= new AdminDTO();
            dto.setAddress(faddress);
            dto.setCity(fcity);
            dto.setContact(fcontact);
            dto.setDept(fdept);
            dto.setId(fid);
            dto.setName(fname);
            dto.setPassword(fpassword);
            
            FacultyAuthenticator f1 = new FacultyAuthenticator();
            boolean insert = f1.isStudent(dto);
            if(insert)
            {
                response.sendRedirect("facultyRegistrationSuccess.jsp");
            }
            else
            {
                response.sendRedirect("addstudent2.jsp");
            }
        }
    }
}
