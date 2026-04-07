
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--


|#|Vị trí (dòng/thành phần)                                                                           |Loại vấn đề                                     |Mô tả chi tiết hậu quả                                                                                                                                                                                                                                                                                                                                                                     |
|-|---------------------------------------------------------------------------------------------------|------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|1|`<%! private int requestCounter = 0; %>`                                                           |**Declaration biến dùng chung (Race Condition)**|Biến `requestCounter` được khai báo ở phần Declaration (`<%! %>`) nên tồn tại ở **cấp độ instance của servlet**, dùng chung cho **mọi request và mọi user**. Khi nhiều người truy cập đồng thời, các thread cùng tăng/đọc biến này dẫn đến race condition, số lượt xem hiển thị sai, không thể hiện đúng từng request riêng biệt, và có thể gây lỗi khó debug trong môi trường nhiều luồng.|
|2|Khối scriptlet trong body: `requestCounter++;`, ép kiểu list, lấy title, vòng for, if/else xếp loại|**Logic Java trong View (vi phạm Thin View)**   |Toàn bộ logic xử lý dữ liệu (lấy attribute, cast, vòng lặp for, tính `rank` theo điểm) được viết trực tiếp trong JSP bằng scriptlet. Điều này vi phạm nguyên tắc “View ngốc nghếch”: View chỉ nên hiển thị dữ liệu, còn xử lý nghiệp vụ phải nằm ở Controller/Service. Code trở nên khó bảo trì, khó test, và trộn lẫn HTML + Java gây rối mắt.                                            |
|3|`<td><%= sv.getFullName() %></td>`                                                                 |**XSS (in trực tiếp dữ liệu người dùng)**       |Họ tên sinh viên được in thẳng ra HTML bằng `<%= %>` mà không escape. Nếu dữ liệu `fullName` đến từ nguồn có thể bị can thiệp (user nhập), kẻ tấn công có thể chèn script `<script>...</script>` vào tên, dẫn tới tấn công Cross-Site Scripting (XSS), chiếm cookie, session, hoặc phá giao diện. Cần dùng `<c:out>` hoặc cơ chế escape để an toàn.                                        |
|4|`<td><%= sv.getScore()%>;</td>`                                                                    |**Sai cú pháp Expression (dư dấu chấm phẩy)**   |Expression `<%= sv.getScore()%>;` có thêm dấu chấm phẩy `;` bên ngoài thẻ JSP. Khi JSP được biên dịch sang servlet Java, phần `;` này trở thành ký tự thừa trong output HTML (hoặc dễ gây nhầm lẫn khi maintain). Về mặt cú pháp JSP thì vẫn compile, nhưng đây là lỗi “code smell” và có thể khiến HTML hiển thị điểm kèm dấu `;` không mong muốn.                                        |
|5|Dùng scriptlet for + if/else trong JSP để tính `rank`                                              |**Trộn nghiệp vụ xếp loại vào View**            |Việc tính toán xếp loại (“Xuất sắc”, “Giỏi”, “Khá”,…) được viết bằng if/else trong JSP. Đây là logic nghiệp vụ (business rule) nên lẽ ra phải được xử lý ở Controller/Service, hoặc tối thiểu là bóc tách sang tầng Java, chỉ truyền kết quả sang View. Để trong JSP sẽ khiến việc thay đổi quy tắc xếp loại phải sửa trực tiếp trong file view, khó test unit, và vi phạm phân tầng MVC.  |
|6|`page` directive import nhiều class: `import="java.util.List, com.demo.model.Student"`             |**View phụ thuộc chặt vào model cụ thể**        |JSP đang import trực tiếp `java.util.List` và `com.demo.model.Student`, rồi cast trong scriptlet. Điều này làm View phụ thuộc chặt vào cấu trúc Java cụ thể, khó tái sử dụng, và buộc người đọc JSP phải hiểu code Java. Đúng chuẩn nên chỉ dùng EL/JSTL để duyệt `studentList` mà không cần import/cast ở View.                                                                           |

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Báo cáo điểm</title>
</head>
<body>

<%-- Tiêu đề báo cáo lấy từ model --%>
<h1><c:out value="${reportTitle}" /></h1>

<table border="1">
    <tr>
        <th>STT</th>
        <th>Họ tên</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>

    <c:forEach var="sv" items="${studentList}" varStatus="status">
        <tr>
            <td>${status.index + 1}</td>

                <%-- Họ tên: dùng c:out để chống XSS --%>
            <td><c:out value="${sv.fullName}" /></td>

                <%-- Điểm: dữ liệu số, có thể in trực tiếp bằng EL --%>
            <td>${sv.score}</td>

                <%-- Xếp loại: dùng JSTL thay cho if/else trong scriptlet --%>
            <td>
                <c:choose>
                    <c:when test="${sv.score >= 90}">
                        Xuất sắc
                    </c:when>
                    <c:when test="${sv.score >= 80}">
                        Giỏi
                    </c:when>
                    <c:when test="${sv.score >= 70}">
                        Khá
                    </c:when>
                    <c:when test="${sv.score >= 60}">
                        Trung bình khá
                    </c:when>
                    <c:when test="${sv.score >= 50}">
                        Trung bình
                    </c:when>
                    <c:otherwise>
                        Yếu
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

