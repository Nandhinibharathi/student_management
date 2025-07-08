<!-- File: /WEB-INF/views/login.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
</head>
<body>
  <center>
    <h1>Login</h1>
    <!-- Display login errors if any -->
    <font color="red">${errorMessage}</font>

    <form action="login" method="post">
      Username: <input type="text" name="name" /> <br><br>
      Password: <input type="password" name="password" /> <br><br>
      <input type="submit" value="Login"/>
    </form>
  </center>
</body>
</html>
