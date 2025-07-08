<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url('/pages/images/studii.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
        }

        .form {
            background-color: rgba(255, 255, 255, 0.9);
            max-width: 400px;
            margin: 40px auto;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 1px;
        }

        input[type="text"],input[type="date"], input[type="submit"] {
            width: 100%;
            padding: 9px;
            margin-top: 1px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            margin-top: 1px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>

</head>
<body>

<div class="form"> 
<h2>Edit Students</h2>

    
<form method="post" action="/update">

        <input type="hidden" name="id" value="${student.id}" />

        <label for="name">Enter a Name</label><br>
        <input type="text" id="name" name="name" value="${student.name}" placeholder="Name" required><br><br>

        <label for="DOB">Enter a DOB</label><br>
        <input type="date" id="dob" name="dob" value="${student.dob}" placeholder="DOB" required><br><br>

        <label for="age">Enter a Age:</label><br>
        <input type="text" id="age" name="age" value="${student.age}" placeholder="Age" required><br><br>

        <label for="Fathername">Enter a FatherName</label><br>
        <input type="text" id="Fathername" name="Fathername" value="${student.fathername}" placeholder="FatherName" required><br><br>

        <label for="Mothername">Enter a MotherName</label><br>
        <input type="text" id="Mothername" name="Mothername" value="${student.mothername}" placeholder="MotherName" required><br><br>

        <input type="submit" id="submit" value="Update Students"><br>
    </form>
</div>
</body>
</html>
