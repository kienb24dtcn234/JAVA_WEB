<%--
  Created by IntelliJ IDEA.
  User: cachiu
  Date: 6/4/26
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>


<html>
<body>

<h2>
  Xin chào, ${sessionScope.loggedUser}!
  Vai trò: ${sessionScope.role}
</h2>

<table border="1">
  <tr>
    <th>Mã</th>
    <th>Sản phẩm</th>
    <th>Tổng tiền</th>
    <th>Ngày đặt</th>
  </tr>

  <c:forEach var="o" items="${orderList}">
    <tr>
      <td>${o.id}</td>
      <td>${o.productName}</td>
      <td>
        <fmt:formatNumber value="${o.total}" type="currency" currencySymbol="₫"/>
      </td>
      <td>
        <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy"/>
      </td>
    </tr>
  </c:forEach>
</table>

<p>
  Tổng lượt xem đơn hàng toàn hệ thống:
  ${applicationScope.totalViewCount}
</p>

<a href="logout">Đăng xuất</a>

</body>
</html>
