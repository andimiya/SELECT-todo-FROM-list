\c Andrea;

DROP USER IF EXISTS "michael";
CREATE USER "michael" WITH ENCRYPTED PASSWORD 'stonebreaker';
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";

\c todo_app;

CREATE TABLE "tasks" (
  id SERIAL NOT NULL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE);

ALTER TABLE "tasks"
  DROP COLUMN "completed";
ALTER TABLE "tasks"
  ADD COLUMN "completed_at" TIMESTAMP NULL DEFAULT NULL;