<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
        <img src="assets/icon/logo.png" width="70" height="70"/>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="margin: 0 auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home">Home</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Category
          </a>
          <ul class="dropdown-menu">
              <c:forEach var="c" items="${listCategory}">
                  <li><a class="dropdown-item" href="./home?id_category=${c.id} ">
                       ${c.getName()}
                     </a></li>
              </c:forEach>
          </ul>
        </li>
        <c:if test="${user==null}">
         <li class="nav-item">
          <a class="nav-link" href="login">Login</a>
        </li>
        </c:if>
        <c:if test="${user!=null}">
            <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Hi ${user.splitName(user.getName())}
          </a>
          <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="profile">Profile</a></li>
              <li><a class="dropdown-item" href="./views/logout.jsp">Logout</a></li>
          </ul>
        </li>
        </c:if>
       <li class="nav-item">
    <a class="nav-link" href="cart">   <%-- G?i servlet CartServlet --%>
        <img src="assets/icon/cart.png" width="30" height="30"/>
        <i>${cart.size()}</i>
    </a>
</li>
      </ul>
      <form class="d-flex" role="search" action="home" method="get">
    <input class="form-control me-2" type="text" name="keyword" placeholder="Search" value="${param.keyword}" aria-label="Search"/>
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>


    </div>
  </div>
</nav>