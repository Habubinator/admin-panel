-- CreateTable
CREATE TABLE
    "referals" (
        "id" SERIAL NOT NULL,
        "owner_userid" INTEGER NOT NULL,
        "referal_userid" INTEGER NOT NULL,
        CONSTRAINT "referals_pkey" PRIMARY KEY ("id")
    );

-- CreateIndex
CREATE UNIQUE INDEX "referals_id_key" ON "referals" ("id");

-- CreateIndex
CREATE UNIQUE INDEX "referals_referal_userid_key" ON "referals" ("referal_userid");

-- DropIndex
DROP INDEX "referals_referal_userid_key";

-- AlterTable
ALTER TABLE "referals"
DROP COLUMN "owner_userid",
DROP COLUMN "referal_userid",
ADD COLUMN "owner_id" INTEGER NOT NULL,
ADD COLUMN "referal_id" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "referals_referal_id_key" ON "referals" ("referal_id");