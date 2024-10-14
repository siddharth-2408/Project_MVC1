<%-- 
    Document   : updatefaculty
    Created on : 26 Sep, 2024, 9:02:37 PM
    Author     : rajes
--%>

<%@page import="dto.AdminDTO"%>
<%@page import="dao.FacultyDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .home-button {  
            position: fixed;  
            top: 10px;  
            right: 10px;  
            background-color: #4CAF50;  
            color: #fff;  
            padding: 10px 20px;  
            border: none;  
            border-radius: 5px;  
            cursor: pointer;  
            text-decoration: none;  
          }  

        .home-button:hover {  
            background-color: #3e8e41;  
          }
        body {
            background-color: cyan;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #003366;
            text-align: center;
        }
        table {
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #007BFF;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        form {
            text-align: center;
            margin: 20px auto;
        }
        input[type="text"] {
            padding: 10px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"], input[type="button"] {
            padding: 10px 15px;
            margin-left: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #0056b3;
        }
        .no-records {
            text-align: center;
            color: red;
            font-size: 1.2em;
        }
        .success {
            text-align: center;
            color: green;
            font-size: 1.2em;
        }
    </style>
    </head>
    <body bgcolor="cyan">
        <a href="adminHome.html" class="home-button">Home</a>
        <h1>Hello Admin!</h1>
        <form action="updatefaculty.jsp" method="post">
        <table>    
            <tr>
                <td>ID:</td>
                <td><input type="text" name="faculty_id" required></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" /></td>
            </tr>
        </table>
        </form>
        <%
            String facultyId = request.getParameter("faculty_id");
            if(facultyId !=null && !facultyId.trim().equals(""))
            {
                FacultyDetails fDAO = new FacultyDetails();
                AdminDTO faculty =  fDAO.getUserDetail(facultyId);
                if(faculty.getName() == null)
                {
                    %>
                    <h2>No Records Found for <%=facultyId%></h2>        
                    <%
                }
                else
                {
                    %>
        <form action="UpdateFaculty" method="post">
        <table>
            <tr>
                <td><strong>Faculty ID: </strong></td>
                <td>
                    <input type="text" name="facultyid" disabled="disabled" value="<%=facultyId%>" />
                    <input type="hidden" name="facultyid" value="<%=facultyId%>" />
                </td>
            </tr>
            <tr>
                <td><strong>Faculty Name: </strong></td>
                <td><input type="text" name="facultyname" value="<%=faculty.getName()%>" /></td>
            </tr>
            <tr>
                <td><strong>Faculty Address: </strong></td>
                <td><input type="text" name="facultyadd" value="<%=faculty.getAddress()%>" /></td>
            </tr>
            <tr>
                <td><strong>Faculty Contact: </strong></td>
                <td><input type="text" name="facultycontact" value="<%=faculty.getContact()%>" /></td>
            </tr>
            <tr>
                <td><strong>Faculty City: </strong></td>
                <td><input type="text" name="facultycity" value="<%=faculty.getCity()%>" /></td>
            </tr>
            <tr>
                <td><strong>Faculty Department: </strong></td>
                <td>
                <SELECT name="facultydept">
                    <option><strong>CSE</strong></option>
                    <option><strong>IT</strong></option>
                    <option><strong>AIML</strong></option>
                </SELECT>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="reset" />
                    <input type="submit" value="Update" />
                </td>
            </tr>            
        </table>
        </form>                    
                    
                    <%
                }
            }
        %>
    </body>
</html>
