<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.AdminDTO"%>
<%@page import="dao.FacultyDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Faculty Details</title>
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
            text-align: center;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow: hidden; /* To round the corners of the table */
        }
        th, td {
            border: 1px solid #ccc;
            padding: 15px;
            text-align: left;
            transition: background-color 0.3s; /* Smooth hover transition */
        }
        th {
            background-color: #007BFF;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e0f7ff; /* Light blue hover effect */
        }
    </style>
</head>
<body>
    <a href="adminHome.html" class="home-button">Home</a>
    <h1>Hello Admin!</h1>
    <h1>Faculty Details are as Follows</h1>
    <%
        FacultyDetails ob1 = new FacultyDetails();
        ArrayList<AdminDTO> l2 = ob1.getAllUserDetails();
        Iterator<AdminDTO> i = l2.iterator();
    %>
    <table>
        <tr>
            <th>Staff ID</th>
            <th>Staff Name</th>
            <th>Staff Department</th>
            <th>Staff Contact</th>
            <th>Staff City</th>
            <th>Staff Address</th>
            <th>Staff Role</th>
        </tr>
        <%
            while(i.hasNext()) {
                AdminDTO user = i.next();
        %>
        <tr>
            <td><%=user.getId()%></td>
            <td><%=user.getName()%></td>
            <td><%=user.getDept()%></td>
            <td><%=user.getContact()%></td>
            <td><%=user.getCity()%></td>
            <td><%=user.getAddress()%></td>
            <td><%=user.getRole()%></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
