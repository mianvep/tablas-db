CREATE TABLE "users" (
  "id" serial PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "products" (
  "id" serial PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "image" varchar NOT NULL,
  "price" int NOT NULL,
  "category_id" int NOT NULL
);

CREATE TABLE "cart" (
  "id" serial PRIMARY KEY NOT NULL,
  "orders_id" int NOT NULL,
  "amount" int NOT NULL,
  "product_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "orders" (
  "id" serial PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "amoun" int NOT NULL,
  "total_price" int NOT NULL,
  "user_id" int NOT NULL
);

ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "cart" ADD FOREIGN KEY ("orders_id") REFERENCES "orders" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "cart" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");
