<%--
  Created by IntelliJ IDEA.
  User: cachiu
  Date: 6/4/26
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>

<h2>Đăng nhập</h2>

<form action="login" method="post">
  Username: <input type="text" name="username"/><br/>
  Password: <input type="password" name="password"/><br/>
  <button type="submit">Login</button>
</form>

<p style="color:red">${error}</p>

</body>
</html>
