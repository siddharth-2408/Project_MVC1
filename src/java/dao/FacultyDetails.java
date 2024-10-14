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
public class FacultyDetails 
{
    public AdminDTO getUserDetail(String fid)
    {
        AdminDTO admin = new AdminDTO();
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs = st.executeQuery("SELECT faculty_name,faculty_dept,faculty_contact,faculty_city,faculty_address,role FROM faculty where faculty_id='"+fid+"'");
            if(rs.next())
            {
                admin.setName(rs.getString(1));
                admin.setDept(rs.getString(2));
                admin.setContact(rs.getString(3));
                admin.setCity(rs.getString(4));
                admin.setAddress(rs.getString(5));
                admin.setRole(rs.getString(6));
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return admin;
    }
    public ArrayList<AdminDTO> getAllUserDetails()
    {
        ArrayList<AdminDTO> l1 = new ArrayList<AdminDTO>();
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs = st.executeQuery("SELECT faculty_id,faculty_name,faculty_dept,faculty_contact,faculty_city,faculty_address,role FROM faculty");
            while(rs.next())
            {
                AdminDTO admin = new AdminDTO();
                admin.setId(rs.getString(1));
                admin.setName(rs.getString(2));
                admin.setDept(rs.getString(3));
                admin.setContact(rs.getString(4));
                admin.setCity(rs.getString(5));
                admin.setAddress(rs.getString(6));
                admin.setRole(rs.getString(7));
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
