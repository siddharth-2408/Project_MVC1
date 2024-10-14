<%@page import="dto.AdminDTO"%>
<%@page import="dao.FacultyDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Faculty</title>
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
    </style>
</head>
<body>
    <a href="adminHome.html" class="home-button">Home</a>
    <h1>Hello Admin!</h1>
    <form action="" method="post">
        <table>
            <tr>
                <td>ID:</td>
                <td><input type="text" name="faculty_id" required></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Search">
                    <a href="viewallfaculty.jsp">
                        <input type="button" value="View All Faculty Data"/>
                    </a>
                </td>
            </tr>
        </table>
    </form>
    <table>
        <%
            String fid = request.getParameter("faculty_id");
            FacultyDetails f1 = new FacultyDetails();
            AdminDTO dto = f1.getUserDetail(fid);
            if (dto == null) {
        %>
                <tr>
                    <td colspan="5" class="no-records">No Records Found for <%= fid %></td>
                </tr>
        <%
            } else {   
        %>
            <tr>
                <th>Staff Name</th>
                <th>Staff Department</th>
                <th>Staff Contact</th>
                <th>Staff City</th>
                <th>Staff Address</th>
                <th>Staff Role</th>
            </tr>
            <tr>
                <td><%= dto.getName() %></td>
                <td><%= dto.getDept() %></td>
                <td><%= dto.getContact() %></td>
                <td><%= dto.getCity() %></td>
                <td><%= dto.getAddress() %></td>
                <td><%= dto.getRole()%></td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
