<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Thêm sản phẩm mới</h2>
    <form method="post" action="${pageContext.request.contextPath}/addProduct">
        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Ảnh (link)</label>
            <input type="text" name="image" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" step="0.01" name="price" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Số lượng</label>
            <input type="number" name="quantity" class="form-control" required>
        </div>
        <div class="form-check mb-3">
            <input type="checkbox" name="status" class="form-check-input" id="status">
            <label class="form-check-label" for="status">Còn hàng</label>
        </div>
        <div class="mb-3">
            <label class="form-label">Danh mục</label>
            <select name="id_category" class="form-select" required>
                <c:forEach var="c" items="${listCategory}">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Thêm</button>
        <a href="${pageContext.request.contextPath}/admin" class="btn btn-secondary">Hủy</a>
    </form>
</div>
</body>
</html>
