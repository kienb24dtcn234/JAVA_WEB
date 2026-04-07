<%--
  Created by IntelliJ IDEA.
  User: cachiu
  Date: 7/4/26
  Time: 00:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thống kê sinh viên</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: #f5f7fb;
            margin: 0;
            padding: 20px;
        }

        /* Title */
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        /* Card chung */
        .card {
            background: white;
            border-radius: 16px;
            padding: 20px;
            margin: 15px auto;
            max-width: 700px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.08);
        }

        /* Text */
        .card p {
            margin: 8px 0;
            color: #444;
        }

        .card h3 {
            margin-top: 0;
            color: #555;
        }

        /* Highlight number */
        .big {
            font-size: 24px;
            font-weight: bold;
            color: #4CAF50;
        }

        /* List */
        ul {
            padding-left: 20px;
        }

        li {
            margin-bottom: 6px;
        }

        /* Button */
        a {
            display: block;
            width: fit-content;
            margin: 30px auto;
            padding: 10px 18px;
            background: #4CAF50;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.3s;
        }

        a:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
<h1>Thống kê sinh viên</h1>

<p>Tổng số sinh viên trong nhóm: ${totalStudents}</p>

<p>GPA trung bình của toàn nhóm: ${averageGpa}</p>

<h3>Tỷ lệ % sinh viên theo trạng thái</h3>
<ul>
    <li>Tốt: ${statusPercentage["Đang học"]}%</li>
    <li>Khá: ${statusPercentage["Bảo lưu"]}%</li>
    <li>Trung bình: ${statusPercentage["Tốt nghiệp"]}%</li>
</ul>

<h3>Thủ khoa của nhóm</h3>
<c:if test="${not empty topStudent}">
    <p>Họ tên: ${topStudent.fullName}</p>
    <p>Mã SV: ${topStudent.studentCode}</p>
    <p>Khoa: ${topStudent.faculty}</p>
    <p>Năm nhập học: ${topStudent.enrollmentYear}</p>
    <p>GPA: ${topStudent.gpa}</p>
    <p>Trạng thái: ${topStudent.status}</p>
</c:if>

<p>
    <a href="${pageContext.request.contextPath}/student">Quay lại danh sách sinh viên</a>
</p>

</body>
</html>

