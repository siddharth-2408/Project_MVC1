<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Faculty</title>
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
        }
        table {
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: white;
        }
        td {
            padding: 10px;
        }
        input[type="text"], input[type="password"] {
            width: 200px;
            padding: 5px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <a href="adminHome.html" class="home-button">Home</a>
    <h1 style="text-align:center;">Adding A New Faculty!</h1>
    <form action="AddFacultyChecker" method="post">
        <table>
            <tr>
                <td><strong>Id:</strong></td>
                <td><input type="text" name="faculty_id" placeholder="Enter Faculty ID" required /></td>
            </tr>
            <tr>
                <td><strong>Name:</strong></td>
                <td><input type="text" name="faculty_name" placeholder="Enter Name" required /></td>
            </tr>
            <tr>
                <td><strong>Department: </strong></td>
                <td>
                <SELECT name="faculty_dept">
                    <option><strong>CSE</strong></option>
                    <option><strong>AIML</strong></option>
                    <option><strong>IOT</strong></option>
                </SELECT>
                </td>
            </tr>
            <tr>
                <td><strong>Role: </strong></td>
                <td>
                <SELECT name="role">
                    <option><strong>Faculty</strong></option>
                    <option><strong>HOD</strong></option>
                </SELECT>
                </td>
            </tr>
            <tr>
                <td><strong>Contact:</strong></td>
                <td><input type="text" name="faculty_contact" placeholder="Enter Contact Details" required /></td>
            </tr>
            <tr>
                <td><strong>City:</strong></td>
                <td><input type="text" name="faculty_city" placeholder="Enter City" required /></td>
            </tr>
            <tr>
                <td><strong>Address:</strong></td>
                <td><input type="text" name="faculty_address" placeholder="Enter Address" required /></td>
            </tr>
            <tr>
                <td><strong>Password:</strong></td>
                <td><input type="password" name="faculty_password" placeholder="Enter Password" required /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Add Faculty" /></td> 
            </tr>
        </table>
    </form>
</body>
</html>
