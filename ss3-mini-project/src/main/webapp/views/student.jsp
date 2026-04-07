<%@ page import="re.edu.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Quản lí sinh viên</title>
    <style>
        .status-dang-hoc {
            color: green;
            font-weight: bold;
        }
        .status-bao-luu {
            color: orange;
            font-weight: bold;
        }
        .status-tot-nghiep {
            color: blue;
            font-weight: bold;
        }body {
             font-family: 'Segoe UI', Tahoma, sans-serif;
             background: #f5f7fb;
             margin: 0;
             padding: 20px;
         }

        /* Title */
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* Form search */
        form {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 8px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            width: 250px;
            outline: none;
            transition: 0.3s;
        }

        input[type="text"]:focus {
            border-color: #4CAF50;
        }

        button {
            padding: 8px 16px;
            border: none;
            background: #4CAF50;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #45a049;
        }

        /* Links sort */
        a {
            display: inline-block;
            margin: 5px 10px;
            color: #4CAF50;
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Table */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0,0,0,0.08);
        }

        thead {
            background: #4CAF50;
            color: white;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        tbody tr {
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #f1f1f1;
        }

        /* Status */
        .status-dang-hoc {
            color: #2ecc71;
            font-weight: bold;
        }

        .status-bao-luu {
            color: #f39c12;
            font-weight: bold;
        }

        .status-tot-nghiep {
            color: #3498db;
            font-weight: bold;
        }

        /* Detail button */
        td a {
            padding: 6px 10px;
            background: #3498db;
            color: white;
            border-radius: 6px;
            font-size: 14px;
        }

        td a:hover {
            background: #2980b9;
        }

        /* Empty message */
        p {
            text-align: center;
            color: #888;
            font-style: italic;
        }

        /* Dashboard link */
        body > a:last-child {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h1>Quản lí sinh viên</h1>

<form action="/student/search" method="get">
    Search: <input type="text" name="keyword"><br>
    <button type="submit">Search</button>
</form>

<a href="/student?sortBy=name">Sắp xếp theo tên</a><br>
<a href="/student?sortBy=gpa">Sắp xếp theo GPA</a>

<c:if test="${size <= 0}">
    <p>Không tìm thấy sinh viên nào</p>
</c:if>

<c:if test="${size > 0}">
    <table border="1">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã SV</th>
            <th>Họ tên</th>
            <th>Khoa</th>
            <th>Năm nhập học</th>
            <th>GPA</th>
            <th>Trạng thái</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${students}" var="st" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${st.studentCode}</td>
                <td>${st.fullName}</td>
                <td>${st.faculty}</td>
                <td>${st.enrollmentYear}</td>
                <td>${st.gpa}</td>
                <td>
                    <c:choose>
                        <c:when test="${st.status eq 'Đang học'}">
                            <span class="status-dang-hoc">${st.status}</span>
                        </c:when>
                        <c:when test="${st.status eq 'Bảo lưu'}">
                            <span class="status-bao-luu">${st.status}</span>
                        </c:when>
                        <c:when test="${st.status eq 'Tốt nghiệp'}">
                            <span class="status-tot-nghiep">${st.status}</span>
                        </c:when>
                        <c:otherwise>
                            ${st.status}
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><a href="/student/detail?id=${st.id}">Xem chi tiết</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<a href="/dashboard">Xem thống kê</a>
</body>
</html>
