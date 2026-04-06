<%--
  Created by IntelliJ IDEA.
  User: cachiu
  Date: 6/4/26
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
1. Tại sao thông báo lỗi đăng nhập phải lưu vào Request Scope mà không phải Session Scope?

Thông báo lỗi đăng nhập (ví dụ: “Sai username hoặc password”) chỉ có ý nghĩa trong một lần request duy nhất — tức là khi người dùng submit form login.

Vì vậy, dữ liệu này nên được lưu trong Request Scope để:

Chỉ tồn tại trong request hiện tại
Sau khi reload hoặc chuyển trang, thông báo sẽ tự động biến mất

Nếu lưu vào Session Scope, sẽ xảy ra các vấn đề:

Thông báo lỗi bị “dính” lại trong session
Khi người dùng đăng nhập lại hoặc chuyển trang khác, lỗi vẫn hiển thị dù không còn đúng
Gây hiển thị sai trạng thái hệ thống, làm người dùng hiểu nhầm

 Kết luận:
Request Scope phù hợp với dữ liệu ngắn hạn (temporary) như thông báo lỗi.

2. Tại sao totalViewCount phải lưu vào Application Scope?

totalViewCount là bộ đếm tổng số lần xem đơn hàng của toàn hệ thống, không phải của riêng từng người dùng.

Do đó, cần lưu vào Application Scope vì:

Application Scope được chia sẻ cho tất cả user
Mọi request từ mọi session đều truy cập chung 1 giá trị

Nếu lưu vào Session Scope, thì:

Mỗi nhân viên sẽ có một bản riêng
Ví dụ:
Nhân viên A xem 2 lần → thấy 2
Nhân viên B xem 1 lần → thấy 1

 Kết quả:

Không còn là “tổng hệ thống” nữa
Dữ liệu bị phân mảnh theo từng user

 Kết luận:
Application Scope phù hợp với dữ liệu toàn cục (global/shared).

3. Race Condition là gì?

Race Condition là tình huống xảy ra khi:

Nhiều thread truy cập và thay đổi cùng một dữ liệu tại cùng một thời điểm, dẫn đến kết quả sai hoặc không nhất quán.

Trong web:

Mỗi request = 1 thread
Nhiều user truy cập cùng lúc = nhiều thread chạy song song
4. Phân tích đoạn code gây Race Condition
Integer count = (Integer) application.getAttribute("totalViewCount");
if (count == null) count = 0;
count++;
application.setAttribute("totalViewCount", count);
️ Vấn đề

Đoạn code này không thread-safe.

Giả sử có 2 request cùng lúc:

Thread A	     Thread B
đọc count = 5	đọc count = 5
tăng → 6      	tăng → 6
ghi 6	       ghi 6

 Kết quả cuối: 6
 Đúng ra phải là: 7

=> mất dữ liệu (lost update)

5. Cách phòng tránh Race Condition
Cách 1: Dùng synchronized (đơn giản)
synchronized (application) {
    Integer count = (Integer) application.getAttribute("totalViewCount");
    if (count == null) count = 0;
    count++;
    application.setAttribute("totalViewCount", count);
}
 Đảm bảo:
Chỉ 1 thread được vào block tại 1 thời điểm
--%>
</body>
</html>
