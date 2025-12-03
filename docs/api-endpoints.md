# API Endpoints Summary

## Auth
- **POST /auth/register**  
  Register a new user (public)

- **POST /auth/login**  
  User login (public)

---

## Products
- **GET /products**  
  List products (public, supports pagination, sorting, filtering, field selection)

- **POST /products**  
  Create a new product (admin)

- **GET /products/{sku}**  
  Get product details (public)

- **PATCH /products/{sku}**  
  Partially update a product (admin)

- **PUT /products/{sku}**  
  Update product details (admin)

- **DELETE /products/{sku}**  
  Delete (soft/hard) a product (admin)

- **POST /products/{sku}/restore**  
  Restore a soft-deleted product (admin)

---

## Product Reviews
- **GET /products/{sku}/reviews**  
  List reviews for a product (public, paginated)

- **POST /products/{sku}/reviews**  
  Leave a review for a product (authenticated user)

- **PATCH /products/{sku}/reviews/{review_id}**  
  Update a review (owner or admin)

- **DELETE /products/{sku}/reviews/{review_id}**  
  Delete a review (owner or admin)

---

## Categories
- **GET /categories**  
  List categories (public)

- **POST /categories**  
  Create a new category (admin)

- **PUT /categories/{id}**  
  Update a category (admin)

- **DELETE /categories/{id}**  
  Delete a category (admin)

- **POST /categories/{id}/restore**  
  Restore a soft-deleted category (admin)

---

## Users
- **GET /users**  
  List all users (admin, paginated, filterable)

- **GET /users/{id}**  
  Get user details (admin)

- **PUT /users/{id}**  
  Update user details (admin)

- **DELETE /users/{id}**  
  Soft delete a user (admin)

- **POST /users/{id}/restore**  
  Restore a soft-deleted user (admin)

- **GET /users/me**  
  Get current user profile (authenticated user)

- **PUT /users/me**  
  Update current user profile (authenticated user)

- **GET /users/me/loyalty**  
  Get current user's loyalty points and history (authenticated user)

- **GET /users/me/orders**  
  List orders for current user (authenticated user)

- **GET /users/me/support-requests**  
  List
  support requests for current user (authenticated user)

---

## Orders
- **POST /orders**  
  Place a new order (guest or authenticated user)

- **GET /orders**  
  List all orders (admin, paginated, filterable)

- **GET /orders/{id}**  
  Get order details (admin or order owner)

---

## Promotions
- **GET /promotions**  
  List all promotions (admin)

- **POST /promotions**  
  Create promotion (admin)

- **GET /promotions/highlighted**  
  Get highlighted public promotion (public)

- **POST /promotion-codes**  
  Create promotion code (admin)

---

## Wishlists
- **GET /wishlists**  
  List wishlists for current user (authenticated user)

- **POST /wishlists**  
  Create wishlist (authenticated user)

- **POST /wishlists/{id}/items**  
  Add product to wishlist (authenticated user)

- **DELETE /wishlists/{id}/items/{product_id}**  
  Remove product from wishlist (authenticated user)

---

## Shipping Methods
- **GET /shipping-methods**  
  List available shipping methods (public)

- **POST /shipping-methods**  
  Create a new shipping method (admin)

- **PUT /shipping-methods/{id}**  
  Update a shipping method (admin)

---

## Support Requests
- **POST /support-requests**  
  Submit a support request (guest or authenticated user, with attachments)

- **GET /support-requests**  
  List all support requests (admin)

- **GET /support-requests/{id}**  
  Get support request details (admin)

---

## Cart
- **GET /cart**  
  Get current user's cart (authenticated user)

- **POST /cart**  
  Create or replace current user's cart (authenticated user)

- **DELETE /cart**  
  Clear current user's cart (authenticated user)

- **POST /cart/items**  
  Add item to cart (authenticated user)

- **PUT /cart/items**  
  Update item quantity in cart (authenticated user)

- **DELETE /cart/items/{sku}**  
  Remove item from cart (authenticated user)
