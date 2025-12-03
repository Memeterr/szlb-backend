CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar UNIQUE NOT NULL,
  "password_hash" varchar NOT NULL,
  "loyalty_points" integer DEFAULT 0,
  "is_verified" boolean,
  "last_login_at" timestamp,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "products" (
  "id" integer PRIMARY KEY,
  "sku" varchar UNIQUE NOT NULL,
  "name" varchar NOT NULL,
  "description" text,
  "price" decimal(10,2),
  "stock" integer,
  "popularity_score" decimal,
  "is_highlighted" boolean,
  "is_active" boolean DEFAULT true,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "categories" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "parent_id" integer,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "product_categories" (
  "product_id" integer NOT NULL,
  "category_id" integer NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "orders" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "guest_info_id" integer,
  "promotion_code_id" integer,
  "shipping_method_id" integer NOT NULL,
  "user_address_id" integer,
  "invoice_id" varchar,
  "status" varchar NOT NULL,
  "total_price" decimal,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "user_addresses" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "address_type" varchar NOT NULL,
  "phone_number" varchar,
  "label" varchar,
  "country" varchar,
  "city" varchar,
  "postal_code" varchar,
  "street" varchar,
  "house_number" varchar,
  "is_default" boolean DEFAULT false,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "product_images" (
  "id" integer PRIMARY KEY,
  "product_id" integer NOT NULL,
  "image_url" varchar NOT NULL,
  "is_primary" boolean DEFAULT false,
  "uploaded_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "order_items" (
  "id" integer PRIMARY KEY,
  "order_id" integer NOT NULL,
  "product_id" integer NOT NULL,
  "quantity" integer NOT NULL,
  "price_at_purchase" decimal NOT NULL,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "guest_info" (
  "id" integer PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "phone" varchar,
  "shipping_address" text,
  "billing_address" text,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "support_requests" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "guest_info_id" integer,
  "subject" varchar NOT NULL,
  "message" text NOT NULL,
  "status" varchar DEFAULT 'open',
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "product_reviews" (
  "id" integer PRIMARY KEY,
  "product_id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "score" integer NOT NULL,
  "comment" text,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "promotions" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "description" text,
  "discount_type" varchar,
  "discount_value" decimal,
  "min_order_amount" decimal,
  "start_date" date,
  "end_date" date,
  "is_active" boolean DEFAULT true,
  "is_highlighted" boolean DEFAULT false,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "promotion_codes" (
  "id" integer PRIMARY KEY,
  "promotion_id" integer NOT NULL,
  "code" varchar UNIQUE NOT NULL,
  "usage_limit" integer,
  "used_count" integer DEFAULT 0,
  "expires_at" timestamp,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "promotion_categories" (
  "promotion_id" integer NOT NULL,
  "category_id" integer NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "promotion_products" (
  "promotion_id" integer NOT NULL,
  "product_id" integer NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "shipping_methods" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" text,
  "price" decimal(10,2) NOT NULL,
  "estimated_delivery_days" integer,
  "is_active" boolean DEFAULT true,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "loyalty_transactions" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "order_id" integer,
  "points" integer NOT NULL,
  "type" varchar NOT NULL,
  "description" text,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "roles" (
  "id" integer PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "user_roles" (
  "user_id" integer NOT NULL,
  "role_id" integer NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "order_status_history" (
  "id" integer PRIMARY KEY,
  "order_id" integer NOT NULL,
  "status" varchar NOT NULL,
  "changed_at" timestamp NOT NULL,
  "comment" text,
  "created_at" timestamp
);

CREATE TABLE "product_variants" (
  "id" integer PRIMARY KEY,
  "product_id" integer NOT NULL,
  "sku" varchar,
  "name" varchar,
  "price" decimal,
  "stock" integer,
  "is_active" boolean DEFAULT true,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "email_verification_tokens" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "token" varchar UNIQUE NOT NULL,
  "expires_at" timestamp NOT NULL,
  "used" boolean DEFAULT false,
  "created_at" timestamp
);

CREATE TABLE "password_reset_tokens" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "token" varchar UNIQUE NOT NULL,
  "expires_at" timestamp NOT NULL,
  "used" boolean DEFAULT false,
  "created_at" timestamp
);

CREATE TABLE "support_attachments" (
  "id" integer PRIMARY KEY,
  "support_request_id" integer NOT NULL,
  "file_url" varchar NOT NULL,
  "uploaded_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "promotion_code_usages" (
  "id" integer PRIMARY KEY,
  "promotion_code_id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "order_id" integer NOT NULL,
  "used_at" timestamp
);

CREATE TABLE "wishlists" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "name" varchar,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "wishlist_items" (
  "id" integer PRIMARY KEY,
  "wishlist_id" integer NOT NULL,
  "product_id" integer NOT NULL,
  "added_at" timestamp
);

CREATE TABLE "carts" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "cart_items" (
  "id" integer PRIMARY KEY,
  "cart_id" integer NOT NULL,
  "product_id" integer NOT NULL,
  "quantity" integer NOT NULL,
  "added_at" timestamp
);

CREATE TABLE "api_keys" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "key" varchar NOT NULL,
  "is_active" boolean DEFAULT true,
  "created_at" timestamp,
  "updated_at" timestamp,
  "expires_at" timestamp,
  "last_used_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "audit_logs" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "action" varchar NOT NULL,
  "entity" varchar NOT NULL,
  "entity_id" integer,
  "details" text,
  "created_at" timestamp
);

CREATE TABLE "notifications" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "type" varchar,
  "message" text,
  "status" varchar DEFAULT 'pending',
  "sent_at" timestamp,
  "created_at" timestamp
);

CREATE TABLE "product_impressions" (
  "id" integer PRIMARY KEY,
  "product_id" integer NOT NULL,
  "user_id" integer,
  "session_id" varchar,
  "viewed_at" timestamp
);

CREATE INDEX ON "users" ("email");

CREATE INDEX ON "users" ("is_verified");

CREATE INDEX ON "products" ("sku");

CREATE INDEX ON "products" ("is_active");

CREATE INDEX ON "products" ("name");

CREATE INDEX ON "products" ("popularity_score");

CREATE INDEX ON "categories" ("name");

CREATE INDEX ON "categories" ("parent_id");

CREATE INDEX ON "product_categories" ("product_id");

CREATE INDEX ON "product_categories" ("category_id");

CREATE UNIQUE INDEX ON "product_categories" ("product_id", "category_id");

CREATE INDEX ON "orders" ("user_id");

CREATE INDEX ON "orders" ("status");

CREATE INDEX ON "orders" ("promotion_code_id");

CREATE INDEX ON "orders" ("shipping_method_id");

CREATE INDEX ON "orders" ("created_at");

CREATE INDEX ON "user_addresses" ("user_id");

CREATE INDEX ON "user_addresses" ("is_default");

CREATE INDEX ON "user_addresses" ("address_type");

CREATE INDEX ON "product_images" ("product_id");

CREATE INDEX ON "product_images" ("is_primary");

CREATE INDEX ON "order_items" ("order_id");

CREATE INDEX ON "order_items" ("product_id");

CREATE INDEX ON "guest_info" ("email");

CREATE INDEX ON "support_requests" ("user_id");

CREATE INDEX ON "support_requests" ("guest_info_id");

CREATE INDEX ON "support_requests" ("status");

CREATE INDEX ON "product_reviews" ("product_id");

CREATE INDEX ON "product_reviews" ("user_id");

CREATE INDEX ON "product_reviews" ("score");

CREATE INDEX ON "promotions" ("is_active");

CREATE INDEX ON "promotions" ("start_date");

CREATE INDEX ON "promotions" ("end_date");

CREATE INDEX ON "promotion_codes" ("code");

CREATE INDEX ON "promotion_codes" ("promotion_id");

CREATE INDEX ON "promotion_codes" ("expires_at");

CREATE INDEX ON "promotion_categories" ("promotion_id");

CREATE INDEX ON "promotion_categories" ("category_id");

CREATE UNIQUE INDEX ON "promotion_categories" ("promotion_id", "category_id");

CREATE INDEX ON "promotion_products" ("promotion_id");

CREATE INDEX ON "promotion_products" ("product_id");

CREATE UNIQUE INDEX ON "promotion_products" ("promotion_id", "product_id");

CREATE INDEX ON "shipping_methods" ("is_active");

CREATE INDEX ON "shipping_methods" ("name");

CREATE INDEX ON "loyalty_transactions" ("user_id");

CREATE INDEX ON "loyalty_transactions" ("order_id");

CREATE INDEX ON "loyalty_transactions" ("type");

CREATE INDEX ON "roles" ("name");

CREATE INDEX ON "user_roles" ("user_id");

CREATE INDEX ON "user_roles" ("role_id");

CREATE INDEX ON "order_status_history" ("order_id");

CREATE INDEX ON "order_status_history" ("status");

CREATE INDEX ON "order_status_history" ("changed_at");

CREATE INDEX ON "product_variants" ("product_id");

CREATE INDEX ON "product_variants" ("sku");

CREATE INDEX ON "product_variants" ("is_active");

CREATE INDEX ON "email_verification_tokens" ("user_id");

CREATE INDEX ON "email_verification_tokens" ("token");

CREATE INDEX ON "email_verification_tokens" ("expires_at");

CREATE INDEX ON "password_reset_tokens" ("user_id");

CREATE INDEX ON "password_reset_tokens" ("token");

CREATE INDEX ON "password_reset_tokens" ("expires_at");

CREATE INDEX ON "support_attachments" ("support_request_id");

CREATE INDEX ON "promotion_code_usages" ("promotion_code_id");

CREATE INDEX ON "promotion_code_usages" ("user_id");

CREATE INDEX ON "promotion_code_usages" ("order_id");

CREATE INDEX ON "wishlists" ("user_id");

CREATE INDEX ON "wishlists" ("name");

CREATE INDEX ON "wishlist_items" ("wishlist_id");

CREATE UNIQUE INDEX ON "wishlist_items" ("product_id");

CREATE INDEX ON "carts" ("user_id");

CREATE INDEX ON "cart_items" ("cart_id");

CREATE UNIQUE INDEX ON "cart_items" ("product_id");

CREATE INDEX ON "api_keys" ("name");

CREATE INDEX ON "api_keys" ("is_active");

CREATE INDEX ON "audit_logs" ("user_id");

CREATE INDEX ON "audit_logs" ("entity");

CREATE INDEX ON "audit_logs" ("entity_id");

CREATE INDEX ON "notifications" ("user_id");

CREATE INDEX ON "notifications" ("status");

CREATE INDEX ON "product_impressions" ("product_id");

CREATE INDEX ON "product_impressions" ("user_id");

CREATE INDEX ON "product_impressions" ("viewed_at");

COMMENT ON TABLE "users" IS 'Registered users, including customers and admins';

COMMENT ON COLUMN "users"."id" IS 'Unique user identifier';

COMMENT ON COLUMN "users"."first_name" IS 'User first name';

COMMENT ON COLUMN "users"."last_name" IS 'User last name';

COMMENT ON COLUMN "users"."email" IS 'User email address, must be unique';

COMMENT ON COLUMN "users"."password_hash" IS 'Hashed password';

COMMENT ON COLUMN "users"."loyalty_points" IS 'Current points balance for loyalty system';

COMMENT ON COLUMN "users"."is_verified" IS 'True if email is verified';

COMMENT ON COLUMN "users"."last_login_at" IS 'Last login timestamp';

COMMENT ON COLUMN "users"."created_at" IS 'When the user was created';

COMMENT ON COLUMN "users"."updated_at" IS 'When the user was last updated';

COMMENT ON COLUMN "users"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "products" IS 'Products available in the webshop';

COMMENT ON COLUMN "products"."id" IS 'Unique product identifier';

COMMENT ON COLUMN "products"."sku" IS 'Stock Keeping Unit, unique product code for inventory';

COMMENT ON COLUMN "products"."name" IS 'Product name';

COMMENT ON COLUMN "products"."description" IS 'Product description';

COMMENT ON COLUMN "products"."price" IS 'Current product price, two decimal places';

COMMENT ON COLUMN "products"."stock" IS 'Current stock quantity';

COMMENT ON COLUMN "products"."popularity_score" IS 'Calculated popularity for sorting';

COMMENT ON COLUMN "products"."is_highlighted" IS 'True if product is featured/highlighted';

COMMENT ON COLUMN "products"."is_active" IS 'If false, product is disabled and hidden';

COMMENT ON COLUMN "products"."created_at" IS 'When the product was created';

COMMENT ON COLUMN "products"."updated_at" IS 'When the product was last updated';

COMMENT ON COLUMN "products"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "categories" IS 'Product categories, supports hierarchy';

COMMENT ON COLUMN "categories"."id" IS 'Unique category identifier';

COMMENT ON COLUMN "categories"."name" IS 'Category name';

COMMENT ON COLUMN "categories"."parent_id" IS 'Parent category for subcategories, nullable';

COMMENT ON COLUMN "categories"."created_at" IS 'When the category was created';

COMMENT ON COLUMN "categories"."updated_at" IS 'When the category was last updated';

COMMENT ON COLUMN "categories"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "product_categories" IS 'Many-to-many relation between products and categories';

COMMENT ON COLUMN "product_categories"."product_id" IS 'Linked product';

COMMENT ON COLUMN "product_categories"."category_id" IS 'Linked category';

COMMENT ON COLUMN "product_categories"."created_at" IS 'When the link was created';

COMMENT ON TABLE "orders" IS 'Customer orders, including guest and registered users';

COMMENT ON COLUMN "orders"."id" IS 'Unique order identifier';

COMMENT ON COLUMN "orders"."user_id" IS 'Registered user placing the order, nullable for guests';

COMMENT ON COLUMN "orders"."guest_info_id" IS 'Guest info for guest or one-time address orders';

COMMENT ON COLUMN "orders"."promotion_code_id" IS 'Applied promotion code, nullable';

COMMENT ON COLUMN "orders"."shipping_method_id" IS 'Selected shipping method';

COMMENT ON COLUMN "orders"."user_address_id" IS 'Saved address for registered user, nullable';

COMMENT ON COLUMN "orders"."invoice_id" IS 'ID/reference from 3rd party invoice provider';

COMMENT ON COLUMN "orders"."status" IS 'Order status: ENUM: pending, paid, shipped, delivered, cancelled, refunded';

COMMENT ON COLUMN "orders"."total_price" IS 'Total order price';

COMMENT ON COLUMN "orders"."created_at" IS 'When the order was created';

COMMENT ON COLUMN "orders"."updated_at" IS 'When the order was last updated';

COMMENT ON COLUMN "orders"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "user_addresses" IS 'Addresses saved by registered users';

COMMENT ON COLUMN "user_addresses"."id" IS 'Unique address identifier';

COMMENT ON COLUMN "user_addresses"."user_id" IS 'Owner user';

COMMENT ON COLUMN "user_addresses"."address_type" IS 'shipping or billing';

COMMENT ON COLUMN "user_addresses"."phone_number" IS 'Contact phone number';

COMMENT ON COLUMN "user_addresses"."label" IS 'Address label, e.g., Home, Office';

COMMENT ON COLUMN "user_addresses"."country" IS 'Country';

COMMENT ON COLUMN "user_addresses"."city" IS 'City';

COMMENT ON COLUMN "user_addresses"."postal_code" IS 'Postal code';

COMMENT ON COLUMN "user_addresses"."street" IS 'Street name';

COMMENT ON COLUMN "user_addresses"."house_number" IS 'House or apartment number';

COMMENT ON COLUMN "user_addresses"."is_default" IS 'True if this is the default address';

COMMENT ON COLUMN "user_addresses"."created_at" IS 'When the address was created';

COMMENT ON COLUMN "user_addresses"."updated_at" IS 'When the address was last updated';

COMMENT ON COLUMN "user_addresses"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "product_images" IS 'Images for products, supports multiple images per product';

COMMENT ON COLUMN "product_images"."id" IS 'Unique image identifier';

COMMENT ON COLUMN "product_images"."product_id" IS 'Linked product';

COMMENT ON COLUMN "product_images"."image_url" IS 'URL or file path to image';

COMMENT ON COLUMN "product_images"."is_primary" IS 'True if this is the cover photo';

COMMENT ON COLUMN "product_images"."uploaded_at" IS 'When the image was uploaded';

COMMENT ON COLUMN "product_images"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "order_items" IS 'Products included in each order';

COMMENT ON COLUMN "order_items"."id" IS 'Unique order item identifier';

COMMENT ON COLUMN "order_items"."order_id" IS 'Linked order';

COMMENT ON COLUMN "order_items"."product_id" IS 'Linked product';

COMMENT ON COLUMN "order_items"."quantity" IS 'Quantity ordered';

COMMENT ON COLUMN "order_items"."price_at_purchase" IS 'Product price at the time of order';

COMMENT ON COLUMN "order_items"."created_at" IS 'When the item was added to the order';

COMMENT ON COLUMN "order_items"."updated_at" IS 'When the item was last updated';

COMMENT ON COLUMN "order_items"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "guest_info" IS 'Contact and address info for guest orders or one-time addresses';

COMMENT ON COLUMN "guest_info"."id" IS 'Unique guest info identifier';

COMMENT ON COLUMN "guest_info"."first_name" IS 'Guest first name';

COMMENT ON COLUMN "guest_info"."last_name" IS 'Guest last name';

COMMENT ON COLUMN "guest_info"."email" IS 'Guest email address';

COMMENT ON COLUMN "guest_info"."phone" IS 'Guest phone number';

COMMENT ON COLUMN "guest_info"."shipping_address" IS 'Shipping address, nullable';

COMMENT ON COLUMN "guest_info"."billing_address" IS 'Billing address, nullable';

COMMENT ON COLUMN "guest_info"."created_at" IS 'When the guest info was created';

COMMENT ON COLUMN "guest_info"."updated_at" IS 'When the guest info was last updated';

COMMENT ON COLUMN "guest_info"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "support_requests" IS 'Support requests submitted by users or guests';

COMMENT ON COLUMN "support_requests"."id" IS 'Unique support request identifier';

COMMENT ON COLUMN "support_requests"."user_id" IS 'Registered user, nullable for guests';

COMMENT ON COLUMN "support_requests"."guest_info_id" IS 'Guest info for guest requests, nullable';

COMMENT ON COLUMN "support_requests"."subject" IS 'Support request subject';

COMMENT ON COLUMN "support_requests"."message" IS 'Support request message';

COMMENT ON COLUMN "support_requests"."status" IS 'Request status: open, closed, etc.';

COMMENT ON COLUMN "support_requests"."created_at" IS 'When the request was created';

COMMENT ON COLUMN "support_requests"."updated_at" IS 'When the request was last updated';

COMMENT ON COLUMN "support_requests"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "product_reviews" IS 'User reviews for products';

COMMENT ON COLUMN "product_reviews"."id" IS 'Unique review identifier';

COMMENT ON COLUMN "product_reviews"."product_id" IS 'Reviewed product';

COMMENT ON COLUMN "product_reviews"."user_id" IS 'Reviewing user';

COMMENT ON COLUMN "product_reviews"."score" IS 'Rating score, e.g., 1-5';

COMMENT ON COLUMN "product_reviews"."comment" IS 'Review comment';

COMMENT ON COLUMN "product_reviews"."created_at" IS 'When the review was created';

COMMENT ON COLUMN "product_reviews"."updated_at" IS 'When the review was last updated';

COMMENT ON COLUMN "product_reviews"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "promotions" IS 'Promotional campaigns and discounts';

COMMENT ON COLUMN "promotions"."id" IS 'Unique promotion identifier';

COMMENT ON COLUMN "promotions"."name" IS 'Promotion name';

COMMENT ON COLUMN "promotions"."description" IS 'Promotion description';

COMMENT ON COLUMN "promotions"."discount_type" IS 'Type: percent, fixed, free_shipping';

COMMENT ON COLUMN "promotions"."discount_value" IS 'Discount value, e.g., 10 for 10%, 1000 for 1000HUF';

COMMENT ON COLUMN "promotions"."min_order_amount" IS 'Minimum order sum for promotion, nullable';

COMMENT ON COLUMN "promotions"."start_date" IS 'Promotion start date';

COMMENT ON COLUMN "promotions"."end_date" IS 'Promotion end date';

COMMENT ON COLUMN "promotions"."is_active" IS 'True if promotion is active';

COMMENT ON COLUMN "promotions"."is_highlighted" IS 'True if this promotion should be highlighted to users (e.g., for popups or banners)';

COMMENT ON COLUMN "promotions"."created_at" IS 'When the promotion was created';

COMMENT ON COLUMN "promotions"."updated_at" IS 'When the promotion was last updated';

COMMENT ON COLUMN "promotions"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "promotion_codes" IS 'Promotion codes for applying discounts';

COMMENT ON COLUMN "promotion_codes"."id" IS 'Unique code identifier';

COMMENT ON COLUMN "promotion_codes"."promotion_id" IS 'Linked promotion';

COMMENT ON COLUMN "promotion_codes"."code" IS 'Promotion code string';

COMMENT ON COLUMN "promotion_codes"."usage_limit" IS 'Max times this code can be used, nullable';

COMMENT ON COLUMN "promotion_codes"."used_count" IS 'How many times the code has been used';

COMMENT ON COLUMN "promotion_codes"."expires_at" IS 'Promotion code expiration';

COMMENT ON COLUMN "promotion_codes"."created_at" IS 'When the code was created';

COMMENT ON COLUMN "promotion_codes"."updated_at" IS 'When the code was last updated';

COMMENT ON COLUMN "promotion_codes"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "promotion_categories" IS 'Links promotions to categories';

COMMENT ON COLUMN "promotion_categories"."promotion_id" IS 'Linked promotion';

COMMENT ON COLUMN "promotion_categories"."category_id" IS 'Linked category';

COMMENT ON COLUMN "promotion_categories"."created_at" IS 'When the link was created';

COMMENT ON TABLE "promotion_products" IS 'Links promotions to products';

COMMENT ON COLUMN "promotion_products"."promotion_id" IS 'Linked promotion';

COMMENT ON COLUMN "promotion_products"."product_id" IS 'Linked product';

COMMENT ON COLUMN "promotion_products"."created_at" IS 'When the link was created';

COMMENT ON TABLE "shipping_methods" IS 'Available shipping methods';

COMMENT ON COLUMN "shipping_methods"."id" IS 'Unique shipping method identifier';

COMMENT ON COLUMN "shipping_methods"."name" IS 'Shipping method name, e.g., Standard, Express';

COMMENT ON COLUMN "shipping_methods"."description" IS 'Shipping method description';

COMMENT ON COLUMN "shipping_methods"."price" IS 'Base price for this shipping method, two decimal places';

COMMENT ON COLUMN "shipping_methods"."estimated_delivery_days" IS 'Estimated delivery time in days';

COMMENT ON COLUMN "shipping_methods"."is_active" IS 'True if method is available';

COMMENT ON COLUMN "shipping_methods"."created_at" IS 'When the method was created';

COMMENT ON COLUMN "shipping_methods"."updated_at" IS 'When the method was last updated';

COMMENT ON COLUMN "shipping_methods"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "loyalty_transactions" IS 'Tracks loyalty point changes for users';

COMMENT ON COLUMN "loyalty_transactions"."id" IS 'Unique transaction identifier';

COMMENT ON COLUMN "loyalty_transactions"."user_id" IS 'User earning or redeeming points';

COMMENT ON COLUMN "loyalty_transactions"."order_id" IS 'Order related to the transaction, nullable';

COMMENT ON COLUMN "loyalty_transactions"."points" IS 'Points earned (+) or redeemed (-)';

COMMENT ON COLUMN "loyalty_transactions"."type" IS 'Transaction type: earn, redeem, expire, adjust';

COMMENT ON COLUMN "loyalty_transactions"."description" IS 'Transaction description';

COMMENT ON COLUMN "loyalty_transactions"."created_at" IS 'When the transaction was created';

COMMENT ON COLUMN "loyalty_transactions"."updated_at" IS 'When the transaction was last updated';

COMMENT ON COLUMN "loyalty_transactions"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "roles" IS 'User roles for access control';

COMMENT ON COLUMN "roles"."id" IS 'Unique role identifier';

COMMENT ON COLUMN "roles"."name" IS 'Role name, e.g., admin, customer';

COMMENT ON COLUMN "roles"."created_at" IS 'When the role was created';

COMMENT ON COLUMN "roles"."updated_at" IS 'When the role was last updated';

COMMENT ON COLUMN "roles"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "user_roles" IS 'Links users to roles (many-to-many)';

COMMENT ON COLUMN "user_roles"."user_id" IS 'Linked user';

COMMENT ON COLUMN "user_roles"."role_id" IS 'Linked role';

COMMENT ON COLUMN "user_roles"."created_at" IS 'When the link was created';

COMMENT ON TABLE "order_status_history" IS 'Tracks status changes for orders';

COMMENT ON COLUMN "order_status_history"."id" IS 'Unique status history identifier';

COMMENT ON COLUMN "order_status_history"."order_id" IS 'Linked order';

COMMENT ON COLUMN "order_status_history"."status" IS 'Order status: ENUM: pending, paid, shipped, delivered, cancelled, refunded';

COMMENT ON COLUMN "order_status_history"."changed_at" IS 'When the status was changed';

COMMENT ON COLUMN "order_status_history"."comment" IS 'Optional comment or reason for status change';

COMMENT ON COLUMN "order_status_history"."created_at" IS 'When the status change was recorded';

COMMENT ON TABLE "product_variants" IS 'Variants of products, e.g., size, color';

COMMENT ON COLUMN "product_variants"."id" IS 'Unique variant identifier';

COMMENT ON COLUMN "product_variants"."product_id" IS 'Parent product';

COMMENT ON COLUMN "product_variants"."sku" IS 'Stock keeping unit';

COMMENT ON COLUMN "product_variants"."name" IS 'Variant name, e.g., Red, XL';

COMMENT ON COLUMN "product_variants"."price" IS 'Variant price';

COMMENT ON COLUMN "product_variants"."stock" IS 'Variant stock';

COMMENT ON COLUMN "product_variants"."is_active" IS 'True if variant is available';

COMMENT ON COLUMN "product_variants"."created_at" IS 'When the variant was created';

COMMENT ON COLUMN "product_variants"."updated_at" IS 'When the variant was last updated';

COMMENT ON COLUMN "product_variants"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "email_verification_tokens" IS 'Tokens for verifying user email addresses';

COMMENT ON COLUMN "email_verification_tokens"."id" IS 'Unique token identifier';

COMMENT ON COLUMN "email_verification_tokens"."user_id" IS 'User to verify';

COMMENT ON COLUMN "email_verification_tokens"."token" IS 'Verification token';

COMMENT ON COLUMN "email_verification_tokens"."expires_at" IS 'Token expiration time';

COMMENT ON COLUMN "email_verification_tokens"."used" IS 'True if token has been used';

COMMENT ON COLUMN "email_verification_tokens"."created_at" IS 'When the token was created';

COMMENT ON TABLE "password_reset_tokens" IS 'Tokens for password reset requests';

COMMENT ON COLUMN "password_reset_tokens"."id" IS 'Unique token identifier';

COMMENT ON COLUMN "password_reset_tokens"."user_id" IS 'User requesting reset';

COMMENT ON COLUMN "password_reset_tokens"."token" IS 'Reset token';

COMMENT ON COLUMN "password_reset_tokens"."expires_at" IS 'Token expiration time';

COMMENT ON COLUMN "password_reset_tokens"."used" IS 'True if token has been used';

COMMENT ON COLUMN "password_reset_tokens"."created_at" IS 'When the token was created';

COMMENT ON TABLE "support_attachments" IS 'Files attached to support requests';

COMMENT ON COLUMN "support_attachments"."id" IS 'Unique attachment identifier';

COMMENT ON COLUMN "support_attachments"."support_request_id" IS 'Linked support request';

COMMENT ON COLUMN "support_attachments"."file_url" IS 'URL or path to the file';

COMMENT ON COLUMN "support_attachments"."uploaded_at" IS 'When the file was uploaded';

COMMENT ON COLUMN "support_attachments"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "promotion_code_usages" IS 'Tracks usage of promotion codes by users/orders';

COMMENT ON COLUMN "promotion_code_usages"."id" IS 'Unique usage identifier';

COMMENT ON COLUMN "promotion_code_usages"."promotion_code_id" IS 'Used promotion code';

COMMENT ON COLUMN "promotion_code_usages"."user_id" IS 'User who used the code';

COMMENT ON COLUMN "promotion_code_usages"."order_id" IS 'Order where code was used';

COMMENT ON COLUMN "promotion_code_usages"."used_at" IS 'When the code was used';

COMMENT ON TABLE "wishlists" IS 'Wishlists created by users';

COMMENT ON COLUMN "wishlists"."id" IS 'Unique wishlist identifier';

COMMENT ON COLUMN "wishlists"."user_id" IS 'Owner user';

COMMENT ON COLUMN "wishlists"."name" IS 'Wishlist name, e.g., "My Favorites"';

COMMENT ON COLUMN "wishlists"."created_at" IS 'When the wishlist was created';

COMMENT ON COLUMN "wishlists"."updated_at" IS 'When the wishlist was last updated';

COMMENT ON COLUMN "wishlists"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "wishlist_items" IS 'Products added to wishlists';

COMMENT ON COLUMN "wishlist_items"."id" IS 'Unique wishlist item identifier';

COMMENT ON COLUMN "wishlist_items"."wishlist_id" IS 'Linked wishlist';

COMMENT ON COLUMN "wishlist_items"."product_id" IS 'Linked product';

COMMENT ON COLUMN "wishlist_items"."added_at" IS 'When the product was added';

COMMENT ON TABLE "carts" IS 'Shopping carts for users';

COMMENT ON COLUMN "carts"."id" IS 'Unique cart identifier';

COMMENT ON COLUMN "carts"."user_id" IS 'Owner user';

COMMENT ON COLUMN "carts"."created_at" IS 'When the cart was created';

COMMENT ON COLUMN "carts"."updated_at" IS 'When the cart was last updated';

COMMENT ON COLUMN "carts"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "cart_items" IS 'Products in shopping carts';

COMMENT ON COLUMN "cart_items"."id" IS 'Unique cart item identifier';

COMMENT ON COLUMN "cart_items"."cart_id" IS 'Linked cart';

COMMENT ON COLUMN "cart_items"."product_id" IS 'Linked product';

COMMENT ON COLUMN "cart_items"."quantity" IS 'Quantity in cart';

COMMENT ON COLUMN "cart_items"."added_at" IS 'When the product was added';

COMMENT ON TABLE "api_keys" IS 'API keys for third-party integrations';

COMMENT ON COLUMN "api_keys"."id" IS 'Unique API key identifier';

COMMENT ON COLUMN "api_keys"."name" IS 'Integration name, e.g., ShippingProviderX';

COMMENT ON COLUMN "api_keys"."key" IS 'API key value';

COMMENT ON COLUMN "api_keys"."is_active" IS 'True if key is active';

COMMENT ON COLUMN "api_keys"."created_at" IS 'When the key was created';

COMMENT ON COLUMN "api_keys"."updated_at" IS 'When the key was last updated';

COMMENT ON COLUMN "api_keys"."expires_at" IS 'When the key expires';

COMMENT ON COLUMN "api_keys"."last_used_at" IS 'When the key was last used';

COMMENT ON COLUMN "api_keys"."deleted_at" IS 'Soft delete timestamp, null if active';

COMMENT ON TABLE "audit_logs" IS 'Tracks important actions for compliance and debugging';

COMMENT ON COLUMN "audit_logs"."id" IS 'Unique audit log identifier';

COMMENT ON COLUMN "audit_logs"."user_id" IS 'User who performed the action, nullable';

COMMENT ON COLUMN "audit_logs"."action" IS 'Action type, e.g., create, update, delete, login';

COMMENT ON COLUMN "audit_logs"."entity" IS 'Entity type, e.g., product, order, user';

COMMENT ON COLUMN "audit_logs"."entity_id" IS 'ID of the affected entity';

COMMENT ON COLUMN "audit_logs"."details" IS 'Optional JSON or text with more info';

COMMENT ON COLUMN "audit_logs"."created_at" IS 'When the action occurred';

COMMENT ON TABLE "notifications" IS 'Tracks notifications sent to users (email, SMS, etc.)';

COMMENT ON COLUMN "notifications"."id" IS 'Unique notification identifier';

COMMENT ON COLUMN "notifications"."user_id" IS 'Recipient user';

COMMENT ON COLUMN "notifications"."type" IS 'Notification type, e.g., email, sms';

COMMENT ON COLUMN "notifications"."message" IS 'Notification message content';

COMMENT ON COLUMN "notifications"."status" IS 'Notification status';

COMMENT ON COLUMN "notifications"."sent_at" IS 'When the notification was sent';

COMMENT ON COLUMN "notifications"."created_at" IS 'When the notification was created';

COMMENT ON TABLE "product_impressions" IS 'Tracks product views for analytics and recommendations';

COMMENT ON COLUMN "product_impressions"."id" IS 'Unique impression identifier';

COMMENT ON COLUMN "product_impressions"."product_id" IS 'Viewed product';

COMMENT ON COLUMN "product_impressions"."user_id" IS 'Viewing user, nullable for guests';

COMMENT ON COLUMN "product_impressions"."session_id" IS 'Session identifier for anonymous users';

COMMENT ON COLUMN "product_impressions"."viewed_at" IS 'When the product was viewed';

ALTER TABLE "carts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "cart_items" ADD FOREIGN KEY ("cart_id") REFERENCES "carts" ("id");

ALTER TABLE "cart_items" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "wishlists" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "wishlist_items" ADD FOREIGN KEY ("wishlist_id") REFERENCES "wishlists" ("id");

ALTER TABLE "wishlist_items" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "promotion_code_usages" ADD FOREIGN KEY ("promotion_code_id") REFERENCES "promotion_codes" ("id");

ALTER TABLE "promotion_code_usages" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "promotion_code_usages" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "support_attachments" ADD FOREIGN KEY ("support_request_id") REFERENCES "support_requests" ("id");

ALTER TABLE "password_reset_tokens" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "email_verification_tokens" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "product_variants" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "order_status_history" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "user_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("user_address_id") REFERENCES "user_addresses" ("id");

ALTER TABLE "loyalty_transactions" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "loyalty_transactions" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("shipping_method_id") REFERENCES "shipping_methods" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("promotion_code_id") REFERENCES "promotion_codes" ("id");

ALTER TABLE "promotion_categories" ADD FOREIGN KEY ("promotion_id") REFERENCES "promotions" ("id");

ALTER TABLE "promotion_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "promotion_products" ADD FOREIGN KEY ("promotion_id") REFERENCES "promotions" ("id");

ALTER TABLE "promotion_products" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "promotion_codes" ADD FOREIGN KEY ("promotion_id") REFERENCES "promotions" ("id");

ALTER TABLE "product_reviews" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "product_reviews" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "support_requests" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "support_requests" ADD FOREIGN KEY ("guest_info_id") REFERENCES "guest_info" ("id");

ALTER TABLE "product_categories" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "product_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("parent_id") REFERENCES "categories" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("guest_info_id") REFERENCES "guest_info" ("id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "product_images" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "user_addresses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
