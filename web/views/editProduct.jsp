<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Product, java.util.List" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <script src ="assets/js/bootstrap.bundle.min.js"></script>
     
    </head>
    <body>
<c:if test="${not empty product}">
    <div class="container my-4">
        <h4>Edit Product: ${product.name}</h4>
        <form action="editProduct" method="post">
            <input type="hidden" name="id" value="${product.id}"/>
            
            <div class="mb-3">
                <label for="name" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
            </div>
            
            <div class="mb-3">
                <label for="image" class="form-label">Image URL</label>
                <input type="text" class="form-control" id="image" name="image" value="${product.image}">
            </div>
            
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" class="form-control" id="price" name="price" value="${product.price}" required>
            </div>
            
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}" required>
            </div>
            
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="status" name="status" value="true" <c:if test="${product.status}">checked</c:if>>
                <label class="form-check-label" for="status">Active</label>
            </div>
            
            <div class="mb-3">
                <label for="id_category" class="form-label">Category</label>
                <select class="form-select" id="id_category" name="id_category" required>
                    <c:forEach var="c" items="${listCategory}">
                        <option value="${c.id}" <c:if test="${c.id == product.id_category}">selected</c:if>>${c.name}</option>
                    </c:forEach>
                </select>
            </div>
            
            <button type="submit" class="btn btn-success">Update</button>
            <a href="admin" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</c:if>
