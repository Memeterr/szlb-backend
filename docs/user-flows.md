# User Flows for Webshop

## User Types
- Guest
- Registered User
- Admin

---

## 1. Guest Browsing and Ordering

**Steps & API Endpoints:**
1. Guest visits homepage.  
   → `GET /products?highlighted=true`
2. Browses product categories and product details.  
   → `GET /categories`  
   → `GET /products`  
   → `GET /products/{sku}`
3. Adds products to cart.  
   → `POST /cart/items`
4. Views cart and proceeds to checkout.  
   → `GET /cart`
5. Enters shipping and billing info in checkout form.
6. (Optional) Applies promotion code.  
   → (included in order request)
7. Selects shipping method.  
   → `GET /shipping-methods`
8. Reviews order summary.
9. Places order as guest.  
   → `POST /orders` (with guest info)
10. Receives order confirmation email.

---

## 2. User Registration

**Steps & API Endpoints:**
1. Guest clicks "Register" or "Sign Up".
2. Fills in registration form (name, email, password).  
   → `POST /auth/register
`
3. Receives verification email.
4. Clicks verification link.
5. Account is activated.

---

## 3. Registered User Ordering

**Steps & API Endpoints:**
1. Logs in.  
   → `POST /auth/login`
2. Browses products, adds to cart.  
   → `GET /products`, `GET /products/{sku}`, `POST /cart/items`
3. Views cart and proceeds to checkout.  
   → `GET /cart`
4. Selects saved address or enters new one.  
   → (address included in order request)
5. (Optional) Applies loyalty points or promotion code.  
   → (included in order request)
6. Selects shipping method.  
   → `GET /shipping-methods`
7. Reviews and places order.  
   → `POST /orders`
8. Receives confirmation.

---

## 4. Leaving a Product Review

**Steps & API Endpoints:**
1. User logs in.  
   → `POST /auth/login`
2. Navigates to order history.  
   → `GET /users/me/orders`
3. Selects a completed order.  
   → `GET /orders/{id}`
4. Clicks "Leave Review" on a purchased product.
5. Submits rating and comment.  
   → `POST /products/{sku}/reviews`

---

## 5. Admin Managing Products

**Steps & API Endpoints:**
1. Admin logs in.  
   → `POST /auth/login`
2. Navigates to admin dashboard.
3. Adds a product.  
   → `POST /products`
4. Edits a product.  
   → `PUT /products/{sku}` or `PATCH /products/{sku}`
5. Disables (soft deletes) a product.

   → `DELETE /products/{sku}`
6. Restores a product.  
   → `POST /products/{sku}/restore`
7. Manages categories.  
   → `POST /categories`, `PUT /categories/{id}`, `DELETE /categories/{id}`, `POST /categories/{id}/restore`
8. Manages orders.  
   → `GET /orders`, `GET /orders/{id}`
9. Manages support requests.  
   → `GET /support-requests`, `GET /support-requests/{id}`

---

## 6. Support Request

**Steps & API Endpoints:**
1. User or guest fills out support form.
2. Submits request.  
   → `POST /support-requests` (with optional attachments)
3. Receives confirmation.
4. Authenticated user can view their requests.  
   → `GET /users/me/support-requests`
5. Admin reviews and responds.  
   → `GET /support-requests`, `GET /support-requests/{id}`

---

## 7. Wishlist Management (Registered User)

**Steps & API Endpoints:**
1. User logs in.  
   → `POST /auth/login`
2. Views wishlists.  
   → `GET /wishlists`
3. Creates a wishlist.  
   → `POST /wishlists`
4. Adds product to wishlist.  
   → `POST /wishlists/{id}/items`
5. Removes product from wishlist.  
   → `DELETE /wishlists/{id}/items/{product_id}`

---

## 8. Cart Management (Registered User)

**Steps & API Endpoints:**
1. User logs in.  
   → `POST /auth/login`

2. Adds product to cart.  
   → `POST /cart/items`
3. Updates item quantity.  
   → `PUT /cart/items`
4. Removes item from cart.  
   → `DELETE /cart/items/{sku}`
5. Views cart.  
   → `GET /cart`
6. Clears cart.  
   → `DELETE /cart`

---

## 9. Viewing Highlighted Promotion

**Steps & API Endpoints:**
1. User visits site; frontend checks for highlighted promotion to display as popup/banner.  
   → `GET /promotions/highlighted`
