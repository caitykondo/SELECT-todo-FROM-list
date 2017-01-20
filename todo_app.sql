DROP USER "michael";
CREATE USER "michael";
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";

\c todo_app;

CREATE TABLE "tasks" (
  id serial PRIMARY KEY NOT NULL,
  title varchar(255), description text,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  completed boolean
);

ALTER TABLE "tasks" DROP COLUMN completed;
ALTER TABLE "tasks" ADD COLUMN completed_at timestamp;
ALTER TABLE "tasks" ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE "tasks" ALTER COLUMN updated_at SET DEFAULT now();
INSERT INTO "tasks" VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), null);
INSERT INTO "tasks" (title, description) VALUES('Study PostgreSQL', 'Read all the documentation');
SELECT * FROM "tasks" WHERE completed_at IS null;
UPDATE "tasks" SET completed_at = now() WHERE title = 'Study SQL';
SELECT tasks.title, tasks.description FROM "tasks" WHERE completed_at IS null;
SELECT * FROM "tasks" ORDER BY created_at DESC;
INSERT INTO "tasks" (title, description) VALUES ('mistake 1', 'a test entry');
INSERT INTO "tasks" (title, description) VALUES ('mistake 2', 'another a test entry');
INSERT INTO "tasks" (title, description) VALUES ('third mistake', 'another a test entry');
SELECT * FROM "tasks" WHERE title::text LIKE '%mistake%';
DELETE FROM "tasks" WHERE title = 'mistake 1';
SELECT tasks.title, tasks.description FROM "tasks" WHERE title::text LIKE '%mistake%';
DELETE FROM "tasks" WHERE title::text LIKE '%mistake%';
SELECT * FROM "tasks" ORDER BY title ASC;