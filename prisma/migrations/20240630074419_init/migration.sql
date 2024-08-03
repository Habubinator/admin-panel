-- CreateTable
CREATE TABLE
    "users" (
        "id" INTEGER NOT NULL,
        "username" VARCHAR(255) NOT NULL,
        "gamesave" VARCHAR(511) NOT NULL,
        "points" INTEGER NOT NULL,
        "gems" INTEGER NOT NULL,
        "lastOnline" BIGINT NOT NULL,
        "lastDailyRewardPick" BIGINT NOT NULL,
        CONSTRAINT "users_pkey" PRIMARY KEY ("id")
    );

CREATE UNIQUE INDEX "users_id_key" ON "users" ("id");

ALTER TABLE "users"
ALTER COLUMN "lastOnline"
SET
    DATA TYPE INTEGER,
ALTER COLUMN "lastDailyRewardPick"
SET
    DATA TYPE INTEGER;