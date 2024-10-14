package model;

import dao.FacultyDetails;
import db.DBConnector;
import dto.AdminDTO;
import dto.LoginDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author rajes
 */
public class FacultyAuthenticator 
{
    public boolean isLogin(LoginDTO user)
    {
        String username = user.getUsername();
        String password = user.getPassword();
        
        if(username!=null && password!=null && !username.trim().equals(""))
        {
            Statement st = DBConnector.getStatement();
            try
            {
                String query = "SELECT faculty_password,role FROM faculty where faculty_id='"+username+"'";
                System.out.println(query);
            
                ResultSet rs = st.executeQuery(query);
                if(rs.next())
                {
                    String tablePassword= rs.getString(1);
                    user.setRole(rs.getString(2));
                    return password.equals(tablePassword);
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
        }
        return false;
    }
    public boolean isFaculty(AdminDTO user)
        {
            Connection con = DBConnector.getConnection();
            PreparedStatement pst = null;
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Loaded");
            
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdatabase","root","root");
                System.out.println("Connected");
            
                pst = con.prepareStatement("INSERT INTO faculty VALUES(?,?,?,?,?,?,?,?)");
                
                pst.setString(1, user.getId());
                pst.setString(2, user.getName());
                pst.setString(3, user.getDept());
                pst.setString(4, user.getContact());
                pst.setString(5, user.getCity());
                pst.setString(6, user.getAddress());
                pst.setString(7, user.getPassword());
                pst.setString(8, user.getRole());
                
                int i = pst.executeUpdate();

                if(i>0)
                {
                    return true;
                }
            }
            catch(ClassNotFoundException | SQLException e)
            {
                System.out.println(e);
            }
            return false;
        }
    
    public boolean isStudent(AdminDTO user)
        {
            Connection con = DBConnector.getConnection();
            PreparedStatement pst = null;
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Loaded");
            
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdatabase","root","root");
                System.out.println("Connected");
            
                pst = con.prepareStatement("INSERT INTO student VALUES(?,?,?,?,?,?,?)");
                
                pst.setString(1, user.getId());
                pst.setString(2, user.getName());
                pst.setString(3, user.getDept());
                pst.setString(4, user.getContact());
                pst.setString(5, user.getCity());
                pst.setString(6, user.getAddress());
                pst.setString(7, user.getPassword());
                
                int i = pst.executeUpdate();

                if(i>0)
                {
                    return true;
                }
            }
            catch(ClassNotFoundException | SQLException e)
            {
                System.out.println(e);
            }
            return false;
        }
    
    public boolean deleteFaculty(String fid)
    {
        try
        {
            Statement st = DBConnector.getStatement();
            String query = "DELETE FROM faculty WHERE faculty_id='"+fid+"'";
            int i = st.executeUpdate(query);
            
            if(i>0)
            {
                return true;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean updateFaculty(AdminDTO user)
    {
        try
        {
            Statement st = DBConnector.getStatement();
            String query = "UPDATE faculty SET faculty_name = '"+user.getName()+"', faculty_dept = '"+user.getDept()+"', faculty_contact = '"+user.getContact()+"', faculty_city = '"+user.getCity()+"', faculty_address = '"+user.getAddress()+"' WHERE faculty_id = '"+user.getId()+"';";
            System.out.println("Update Faculty Query = "+query);
            int i = st.executeUpdate(query);
            if(i>0)
            {
                return true;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return false;
    }
            
}
