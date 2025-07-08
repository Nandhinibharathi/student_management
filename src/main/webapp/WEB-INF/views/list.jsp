<%@ page import="java.util.List" %>
<%@ page import="com.example.StudentManagement_1.pathmodel.Student" %>
<html>
<head>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: url("/images/school.jpg") no-repeat center center;
  background-size: cover;
  text-align: center;
  font-family: Arial, sans-serif;
  background-color: #f9f9f9;
  color: #333;
  padding: 20px;
}

/* Headings */
h2 {
  margin-bottom: 15px;
  color: #2c3e50;
}

/* Form styles */
form {
  background-color:#f7f7f7;
  padding: 20px;
  margin-bottom: 30px;
  border-radius: 10px;
  display: inline-block;
  text-align: left;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

form label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}
form input[type="number"],
form input[type="text"] {
  width: 100%;
  padding: 2px;
  margin-bottom: 5px;
  border: 1px solid #ccd0d5;
  border-radius: 2px;
}
form button {
  background: #3498db;
  color: #fff;
  align-items:center;
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
form button:hover {
  background: #2980b9;
}

/* Table */
table {
  width: 100%;
  border-collapse: collapse;
  background: #fff;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}
th, td {
  padding: 12px 15px;
  border: 1px solid #e1e4e8;
}
th {
  background: #3498db;
  color: #fff;
  text-align: left;
}
tr:nth-child(even) {
  background: #f2f7fb;
}
td button {
  background: #e74c3c;
  color: #fff;
  border: none;
  padding: 6px 12px;
  border-radius: 4px;
  cursor: pointer;
}
td button:hover {
  background: #c0392b;
}

/* Feedback/message */
#result {
  margin-top: 10px;
  font-weight: bold;
}

/* Refresh Button */
button[onclick^="loadStudents"] {
  margin-bottom: 15px;
  background: #2ecc71;
}
button[onclick^="loadStudents"]:hover {
  background: #27ae60;
}

/* Responsive adjustments */
@media (max-width: 600px) {
  table, thead, tbody, th, td, tr {
    display: block;
  }
  tr {
    margin-bottom: 15px;
  }
  th {
    display: none;
  }
  td {
    position: relative;
    padding-left: 50%;
  }
  td:before {
    content: attr(data-label);
    position: absolute;
    left: 15px;
    top: 12px;
    font-weight: bold;
  }
}
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: url("/images/school.jpg") no-repeat center center;
  background-size: cover;
  text-align: center;
  font-family: Arial, sans-serif;
  background-color: #f9f9f9;
  color: #333;
  padding: 20px;
}

/* Headings */
h2 {
  margin-bottom: 15px;
  color: #2c3e50;
}

/* Form styles */
form {
  background-color:#f7f7f7;
  padding: 20px;
  margin-bottom: 30px;
  border-radius: 10px;
  display: inline-block;
  text-align: left;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

form label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}
form input[type="number"],
form input[type="text"] {
  width: 100%;
  padding: 2px;
  margin-bottom: 5px;
  border: 1px solid #ccd0d5;
  border-radius: 2px;
}
form button {
  background: #3498db;
  color: #fff;
  align-items:center;
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
form button:hover {
  background: #2980b9;
}

/* Table */
table {
  width: 100%;
  border-collapse: collapse;
  background: #fff;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}
th, td {
  padding: 12px 15px;
  border: 1px solid #e1e4e8;
}
th {
  background: #3498db;
  color: #fff;
  text-align: left;
}
tr:nth-child(even) {
  background: #f2f7fb;
}
td button {
  background: #e74c3c;
  color: #fff;
  border: none;
  padding: 6px 12px;
  border-radius: 4px;
  cursor: pointer;
}
td button:hover {
  background: #c0392b;
}

/* Feedback/message */
#result {
  margin-top: 10px;
  font-weight: bold;
}

/* Refresh Button */
button[onclick^="loadStudents"] {
  margin-bottom: 15px;
  background: #2ecc71;
}
button[onclick^="loadStudents"]:hover {
  background: #27ae60;
}

/* Responsive adjustments */
@media (max-width: 600px) {
  table, thead, tbody, th, td, tr {
    display: block;
  }
  tr {
    margin-bottom: 15px;
  }
  th {
    display: none;
  }
  td {
    position: relative;
    padding-left: 50%;
  }
  td:before {
    content: attr(data-label);
    position: absolute;
    left: 15px;
    top: 12px;
    font-weight: bold;
  }
}


</style>

</head>
<body>
  <h2>Student List</h2>
  <a href="${pageContext.request.contextPath}/create">Add New Student</a>
  <a href="${pageContext.request.contextPath}/logout">Logout</a>

  <table border="1">
    <tr><th>ID</th><th>Name</th><th>Department</th><th>Edit</th><th>Delete</th></tr>
    <c:forEach var="s" items="${students}">
      <tr>
        <td>${s.id}</td><td>${s.name}</td><td>${s.dept}</td>
        <td><a href="edit?id=${s.id}">Edit</a></td>
        <td>
          <form action="delete" method="post" style="display:inline">
            <input type="hidden" name="id" value="${s.id}" />
            <button type="submit">Delete</button>
          </form>
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty students}">
      <tr><td colspan="5">No students found.</td></tr>
    </c:if>
  </table>
</body>

</html>
