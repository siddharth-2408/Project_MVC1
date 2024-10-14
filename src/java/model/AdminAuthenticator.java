package model;

import db.DBConnector;
import dto.LoginDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author rajes
 */
public class AdminAuthenticator 
{
    public boolean isLogin(LoginDTO user)
    {
        String username = user.getUsername();
        String password = user.getPassword();
        
        if(username!=null && password!=null && !username.trim().equals("") && username.equals("admin") && password.equals("admin"))
        {
            return true;
        }
        return false;
    }
}
