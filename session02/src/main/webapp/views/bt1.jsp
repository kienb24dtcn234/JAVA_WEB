<%--
  Created by IntelliJ IDEA.
  User: cachiu
  Date: 6/4/26
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<b>
    Phần 1 — Trả lời bằng văn bản

    1. Lỗi trong MyWebAppInitializer.java (Servlet Mapping /api/ → 404)*

    Trong MyWebAppInitializer, phương thức getServletMappings() đang trả về "/api/*". Điều này có nghĩa là DispatcherServlet chỉ lắng nghe các request có đường dẫn bắt đầu bằng /api/ sau context path.

    Ứng dụng được deploy với context path là /demo, nên DispatcherServlet chỉ xử lý các URL dạng /demo/api/... (ví dụ: /demo/api/welcome).

    Trong khi đó, người dùng lại truy cập /demo/welcome (không có /api/). URL này không khớp với pattern /api/*, nên request không đi vào DispatcherServlet. Tomcat không tìm thấy servlet hoặc tài nguyên tĩnh tương ứng /welcome, vì vậy trả về HTTP 404 — Not Found.

    Tóm lại, với cấu hình "/api/*", DispatcherServlet chỉ đang nghe các URL dạng /demo/api/*, còn /demo/welcome thì bị bỏ qua hoàn toàn, dẫn tới lỗi 404.

    2. Lỗi trong WebConfig.java (@ComponentScan vào com.demo.service)

    Trong WebConfig, annotation:

    @ComponentScan(basePackages = "com.demo.service")

    bảo Spring chỉ quét và tạo bean cho các class có annotation (@Controller, @Service, @Repository, …) nằm trong package com.demo.service và các package con.

    Tuy nhiên, controller của ứng dụng là WelcomeController lại nằm trong package com.demo.controller. Vì package này không nằm trong phạm vi quét nên:

    Spring không phát hiện và không tạo bean cho WelcomeController.
    Khi DispatcherServlet nhận request /welcome, cơ chế HandlerMapping không tìm được bất kỳ controller nào mapping với URL này.

    Hậu quả là Spring MVC không thể ánh xạ URL /welcome tới WelcomeController, nên request không được xử lý dù URL đã đi vào DispatcherServlet.

    3. Nếu chỉ sửa lỗi 1 (Servlet Mapping) mà không sửa lỗi 2 (ComponentScan) thì sao?

    Nếu ta sửa getServletMappings() trong MyWebAppInitializer từ "/api/*" thành "/", lúc này DispatcherServlet sẽ lắng nghe tất cả URL dưới context path /demo, bao gồm cả /demo/welcome.

    Tuy nhiên, nếu @ComponentScan vẫn chỉ trỏ vào "com.demo.service", Spring vẫn không quét package com.demo.controller và không tạo bean cho WelcomeController. Khi đó:

    Request /demo/welcome đã đi vào DispatcherServlet.
    Nhưng bên trong không có bất kỳ @Controller nào được đăng ký để xử lý đường dẫn /welcome.

    Vì vậy, chỉ sửa lỗi servlet mapping mà không sửa component scan thì ứng dụng vẫn không chạy đúng. Request /demo/welcome vẫn không được ánh xạ tới controller, thường dẫn đến lỗi 404 từ Spring MVC.


</b>
</body>
</html>
