<%--
  Created by IntelliJ IDEA.
  User: cachiu
  Date: 6/4/26
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
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
            margin-bottom: 20px;
        }

        /* Table */
        table {
            width: 70%;
            margin: 20px auto;
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

        /* Status màu */
        td:last-child {
            font-weight: bold;
        }

        /* Status màu */
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

        /* Button */
        a {
            display: block;
            width: fit-content;
            margin: 20px auto;
            padding: 8px 16px;
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
    <title>Title</title>
</head>
<body>
<h1>Chi tiết sinh viên ${student.fullName}</h1>
<table border ="1">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã SV</th>
        <th>Họ tên</th>
        <th>Khoa</th>
        <th>Năm nhập học</th>
        <th>GPA</th>
        <th>Trạng thái</th>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td>${student.id}</td>
            <td>${student.studentCode}</td>
            <td>${student.fullName}</td>
            <td>${student.faculty}</td>
            <td>${student.enrollmentYear}</td>
            <td>${student.gpa}</td>
            <td class="
    ${student.status == 'Đang học' ? 'status-dang-hoc' :
      student.status == 'Bảo lưu' ? 'status-bao-luu' :
      student.status == 'Tốt nghiệp' ? 'status-tot-nghiep' : ''}">
                ${student.status}
            </td>
        </tr>
    </tbody>
</table>
<a href="/student">Quay lại</a>
</body>
</html>
