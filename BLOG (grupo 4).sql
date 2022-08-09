CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar(25) NOT NULL,
  "email" varchar(30) UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "is_logged" boolean NOT NULL DEFAULT false,
  "country" varchar(15) NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "post" (
  "id" serial PRIMARY KEY,
  "content" text NOT NULL,
  "user_id" int NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "comments" (
  "id" serial PRIMARY KEY,
  "content" text NOT NULL,
  "user_id" int NOT NULL,
  "post_id" int NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "topics" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "post_topics" (
  "id" serial PRIMARY KEY,
  "post_id" int NOT NULL,
  "topic_id" int NOT NULL
);

ALTER TABLE "post" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "post_topics" ADD FOREIGN KEY ("topic_id") REFERENCES "topics" ("id");

ALTER TABLE "post_topics" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");
