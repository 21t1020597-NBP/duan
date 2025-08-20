<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="h-100 h-custom" style="background-color: #f8f9fa;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card shadow-lg rounded-3">
          <div class="card-body p-4">

            <div class="row">
              <!-- LEFT: CART -->
              <div class="col-lg-7">
                <h5 class="mb-3 d-flex justify-content-between">
                  <a href="home" class="text-decoration-none">
                    <i class="fas fa-long-arrow-alt-left me-2"></i> Continue shopping
                  </a>
                </h5>
                <hr>

                <div class="d-flex justify-content-between align-items-center mb-4">
                  <div>
                    <p class="mb-1 fw-bold">Shopping cart</p>
                    <p class="mb-0 text-muted">You have ${cart.size()} items in your cart</p>
                  </div>
                  <div>
                    <p class="mb-0"><span class="text-muted">Sort by:</span> 
                      <a href="#!" class="text-body text-decoration-none">Price 
                        <i class="fas fa-angle-down mt-1"></i>
                      </a>
                    </p>
                  </div>
                </div>

                <c:set var="total" value="0" />
                <c:forEach items="${cart}" var="product">
                 <div class="card mb-3 shadow-sm border-0">
  <div class="card-body">
    <div class="d-flex justify-content-between align-items-center">
      <div class="d-flex flex-row align-items-center">
        <img src="./assets/images/${product.image}" 
             class="img-fluid rounded-3 me-3" alt="${product.name}" style="width: 70px;">
        <div>
          <h6 class="fw-bold mb-1">${product.name}</h6>
          <small class="text-muted">ID: ${product.id}</small>
        </div>
      </div>

      <!-- Form update + delete -->
      <form action="cart" method="post" class="d-flex align-items-center">
        <input type="hidden" name="id_product" value="${product.id}">

        <!-- Số lượng -->
        <input type="number" name="quantity" 
               value="${product.quantity}" min="1"
               class="form-control form-control-sm text-center me-2" 
               style="width: 70px;">

        <!-- Giá -->
        <h6 class="mb-0 fw-bold text-primary me-3">$${product.price}</h6>

        <!-- Nút Sửa -->
        <button type="submit" name="action" value="update" 
                class="btn btn-warning btn-sm fw-bold rounded shadow-sm me-2">
          Sửa
        </button>

        <!-- Nút Xóa -->
        <button type="submit" name="action" value="delete" 
                class="btn btn-danger btn-sm fw-bold rounded shadow-sm">
          Xoá
        </button>
      </form>
    </div>
  </div>
</div>

                  <c:set var="total" value="${total + (product.quantity * product.price)}" />
                </c:forEach>
              </div>

              <!-- RIGHT: CHECKOUT -->
              <div class="col-lg-5">
                <div class="card bg-primary text-white rounded-3 shadow">
                  <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                      <h5 class="mb-0 fw-bold">Card details</h5>
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                           class="img-fluid rounded-circle border border-light"
                           style="width: 50px;" alt="Avatar">
                    </div>

                    <p class="small mb-2 fw-bold">Card type</p>
                    <div class="d-flex mb-3">
                      <img src="./assets/icon/mastercard.png" width="50" height="35" class="me-2 rounded shadow-sm" alt="Mastercard"/>
                      <img src="./assets/icon/vietcombank.png" width="50" height="35" class="me-2 rounded shadow-sm" alt="Vietcombank"/>
                      <img src="./assets/icon/vietinbank.png" width="50" height="35" class="me-2 rounded shadow-sm" alt="Vietinbank"/>
                      <i class="fab fa-cc-paypal fa-2x"></i>
                    </div>

                    <form class="mt-3">
                      <div class="form-outline form-white mb-3">
                        <input type="text" id="cardName" class="form-control form-control-lg" placeholder="${user.name}"/>
                        <label class="form-label" for="cardName">Cardholder</label>
                      </div>
                      <div class="form-outline form-white mb-3">
                        <input type="text" id="cardNumber" class="form-control form-control-lg"
                               placeholder="1234 5678 9012 3457" minlength="19" maxlength="19"/>
                        <label class="form-label" for="cardNumber">Card Number</label>
                      </div>
                      <div class="row mb-3">
                        <div class="col-md-6">
                          <div class="form-outline form-white">
                            <input type="text" id="cardExp" class="form-control form-control-lg"
                                   placeholder="MM/YYYY" minlength="7" maxlength="7"/>
                            <label class="form-label" for="cardExp">Expiration</label>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-outline form-white">
                            <input type="password" id="cardCvv" class="form-control form-control-lg"
                                   placeholder="&#9679;&#9679;&#9679;" minlength="3" maxlength="3"/>
                            <label class="form-label" for="cardCvv">CVV</label>
                          </div>
                        </div>
                      </div>
                    </form>

                    <hr class="my-4">

                    <div class="d-flex justify-content-between">
                      <p class="mb-2">Subtotal</p>
                      <p class="mb-2 fw-bold">$${total}</p>
                    </div>
                    <div class="d-flex justify-content-between">
                      <p class="mb-2">VAT (10%)</p>
                      <p class="mb-2 fw-bold">$${total*0.1}</p>
                    </div>
                    <div class="d-flex justify-content-between mb-4">
                      <p class="mb-2">Total (Incl. taxes)</p>
                      <p class="mb-2 fw-bold fs-5">$${total*1.1}</p>
                    </div>

                    <button type="button" class="btn btn-light btn-block btn-lg shadow fw-bold">
                      <div class="d-flex justify-content-between align-items-center">
                        
                        <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                        <span>Total: $${total*1.1}</span>
                      </div>
                    </button>
                  </div>
                </div>
              </div>
              <!-- END RIGHT -->
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
