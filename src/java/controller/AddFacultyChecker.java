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
public class AddFacultyChecker extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("adminHome.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String fid = request.getParameter("faculty_id");
        String fname = request.getParameter("faculty_name");
        String fdept = request.getParameter("faculty_dept");
        String fcontact = request.getParameter("faculty_contact");
        String fcity = request.getParameter("faculty_city");
        String faddress = request.getParameter("faculty_address");
        String fpassword = request.getParameter("faculty_password");
        String role = request.getParameter("role");
        
        if(fname.trim().equals("")||fpassword.equals("")||fcity.equals("")||fid.equals(""))
        {
            response.sendRedirect("addfaculty2.jsp");
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
            dto.setRole(role);
            
            FacultyAuthenticator f1 = new FacultyAuthenticator();
            boolean insert = f1.isFaculty(dto);
            if(insert)
            {
                response.sendRedirect("facultyRegistrationSuccess.jsp");
            }
            else
            {
                response.sendRedirect("addfaculty2.jsp");
            }
        }
    }
}
