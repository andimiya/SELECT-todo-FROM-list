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
ALTER TABLE "tasks"
  ALTER COLUMN "updated_at" SET NOT NULL;
ALTER TABLE "tasks"
  ALTER COLUMN "updated_at" SET DEFAULT now();

INSERT INTO "tasks" (title, description, created_at, updated_at, completed_at) VALUES ('Study SQL', 'Complete this exercies', now(), now(), NULL);
INSERT INTO "tasks" (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');
SELECT * FROM "tasks";  -- Come back to this one!
  -- WHERE "completed_at" = NULL;

UPDATE "tasks"
  SET "completed_at" = now() WHERE id = 1;

SELECT * FROM "tasks"
  WHERE "completed_at" IS NULL;

SELECT * FROM "tasks"
  ORDER BY "created_at" DESC;

INSERT INTO "tasks" (title, description) VALUES ('mistake 1', 'a test entry');
INSERT INTO "tasks" (title, description) VALUES ('mistake 2', 'a test entry');
INSERT INTO "tasks" (title, description) VALUES ('third mistake', 'a test entry');

SELECT "title" FROM "tasks"
  WHERE "title" LIKE '%mistake%';

DELETE FROM "tasks"
  WHERE "title" LIKE '%mistake 1%';

SELECT "title",
  "description"
  FROM "tasks"
  WHERE "title" LIKE '%mistake%';

DELETE FROM "tasks"
  WHERE "title" LIKE '%mistake%';

SELECT * FROM "tasks"
  ORDER BY "title" ASC;