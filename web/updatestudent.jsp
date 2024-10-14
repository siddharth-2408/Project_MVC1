<%-- 
    Document   : updatestudent
    Created on : 27 Sep, 2024, 10:04:47 PM
    Author     : rajes
--%>

<%@page import="dto.AdminDTO"%>
<%@page import="dao.StudentDetails"%>
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
        <form action="updatestudent.jsp" method="post">
        <table>    
            <tr>
                <td>ID:</td>
                <td><input type="text" name="student_id" required></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" /></td>
            </tr>
        </table>
        </form>
        <%
            String facultyId = request.getParameter("student_id");
            if(facultyId !=null && !facultyId.trim().equals(""))
            {
                StudentDetails fDAO = new StudentDetails();
                AdminDTO faculty =  fDAO.getStudentDetail(facultyId);
                if(faculty.getName() == null)
                {
                    %>
                    <h2>No Records Found for <%=facultyId%></h2>        
                    <%
                }
                else
                {
                    %>
        <form action="UpdateStudent" method="post">
        <table>
            <tr>
                <td><strong>Student ID: </strong></td>
                <td>
                    <input type="text" name="student_id" disabled="disabled" value="<%=facultyId%>" />
                    <input type="hidden" name="student_id" value="<%=facultyId%>" />
                </td>
            </tr>
            <tr>
                <td><strong>Student Name: </strong></td>
                <td><input type="text" name="student_name" value="<%=faculty.getName()%>" /></td>
            </tr>
            <tr>
                <td><strong>Student Address: </strong></td>
                <td><input type="text" name="student_add" value="<%=faculty.getAddress()%>" /></td>
            </tr>
            <tr>
                <td><strong>Student Contact: </strong></td>
                <td><input type="text" name="student_contact" value="<%=faculty.getContact()%>" /></td>
            </tr>
            <tr>
                <td><strong>Student City: </strong></td>
                <td><input type="text" name="student_city" value="<%=faculty.getCity()%>" /></td>
            </tr>
            <tr>
                <td><strong>Student Department: </strong></td>
                <td>
                <SELECT name="student_dept">
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