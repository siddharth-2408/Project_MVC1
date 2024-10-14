/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.AdminDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author rajes
 */
public class StudentDetails 
{
    public AdminDTO getStudentDetail(String sid)
    {
        AdminDTO admin = new AdminDTO();
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs = st.executeQuery("SELECT student_name,student_dept,student_contact,student_city,student_address FROM student where student_id='"+sid+"'");
            if(rs.next())
            {
                admin.setName(rs.getString(1));
                admin.setDept(rs.getString(2));
                admin.setContact(rs.getString(3));
                admin.setCity(rs.getString(4));
                admin.setAddress(rs.getString(5));
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return admin;
    }
    public ArrayList<AdminDTO> getAllStudentDetails()
    {
        ArrayList<AdminDTO> l1 = new ArrayList<AdminDTO>();
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs = st.executeQuery("SELECT student_id,student_name,student_dept,student_contact,student_city,student_address FROM student");
            while(rs.next())
            {
                AdminDTO admin = new AdminDTO();
                admin.setId(rs.getString(1));
                admin.setName(rs.getString(2));
                admin.setDept(rs.getString(3));
                admin.setContact(rs.getString(4));
                admin.setCity(rs.getString(5));
                admin.setAddress(rs.getString(6));
                
                
                l1.add(admin);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return l1;
    }
}
