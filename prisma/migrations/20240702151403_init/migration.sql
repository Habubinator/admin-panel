/*
  Warnings:

  - You are about to drop the `referals` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "referals";

-- DropTable
DROP TABLE "users";

-- CreateTable
CREATE TABLE "Users" (
    "id" INTEGER NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "gamesave" VARCHAR(511) NOT NULL,
    "points" INTEGER NOT NULL,
    "gems" INTEGER NOT NULL,
    "lastOnline" INTEGER NOT NULL,
    "lastDailyRewardPick" INTEGER NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Referals" (
    "id" SERIAL NOT NULL,
    "owner_id" INTEGER NOT NULL,
    "referal_id" INTEGER NOT NULL,

    CONSTRAINT "Referals_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_id_key" ON "Users"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Referals_id_key" ON "Referals"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Referals_referal_id_key" ON "Referals"("referal_id");

-- AddForeignKey
ALTER TABLE "Referals" ADD CONSTRAINT "Referals_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
