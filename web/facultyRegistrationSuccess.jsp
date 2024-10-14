<%-- 
    Document   : facultyRegistrationSuccess
    Created on : 24 Sep, 2024, 12:42:45 PM
    Author     : Pankaj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <style>
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
            max-width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
        }
        td {
            padding: 20px;
            text-align: center;
        }
        a {
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            padding: 15px 25px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }
        .section {
            margin-top: 40px;
            border-bottom: 2px solid #007BFF;
            padding-bottom: 10px;
        }
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

    </style>
</head>
<body>
    <a href="adminHome.html" class="home-button">Home</a>

    <h1>Added Successfully</h1>
    <table>
        <tr class="section">
            <td colspan="4"><h2>Student:</h2></td>
        </tr>
        <tr>
            <td><a href="addstudent.jsp"><strong>Add Student</strong></a></td>
            <td><a href="viewstudent.jsp"><strong>View Student</strong></a></td>
            <td><a href="updatestudent.jsp"><strong>Update Student Records</strong></a></td>
            <td><a href="removestudent.jsp"><strong>Remove Student</strong></a></td>
        </tr>
        <tr class="section">
            <td colspan="4"><h2>Faculty:</h2></td>
        </tr>
        <tr>
            <td><a href="addfaculty.jsp"><strong>Add Faculty</strong></a></td>
            <td><a href="viewfaculty.jsp"><strong>View Faculty</strong></a></td>
            <td><a href="updatefaculty.jsp"><strong>Update Faculty Records</strong></a></td>
            <td><a href="removefaculty.jsp"><strong>Remove Faculty</strong></a></td>
        </tr>
        <tr class="section">
            <td colspan="4"><h2>HODs:</h2></td>
        </tr>
        <tr>
            <td><a href="addhod.jsp"><strong>Add HOD</strong></a></td>
            <td><a href="viewhod.jsp"><strong>View HOD</strong></a></td>
            <td><a href="updatehod.jsp"><strong>Update HOD Records</strong></a></td>
            <td><a href="removehod.jsp"><strong>Remove HOD</strong></a></td>
        </tr>
    </table>
</body>
</html>