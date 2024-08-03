/*
  Warnings:

  - The primary key for the `Users` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Referals" DROP CONSTRAINT "Referals_owner_id_fkey";

-- DropIndex
DROP INDEX "Referals_referal_id_key";

-- AlterTable
ALTER TABLE "Referals" ALTER COLUMN "owner_id" SET DATA TYPE VARCHAR(64),
ALTER COLUMN "referal_id" SET DATA TYPE VARCHAR(64);

-- AlterTable
ALTER TABLE "Users" DROP CONSTRAINT "Users_pkey",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("id");

-- CreateTable
CREATE TABLE "Tasks" (
    "id" SERIAL NOT NULL,
    "logo" VARCHAR(255) NOT NULL DEFAULT '',
    "type" VARCHAR(255) NOT NULL DEFAULT '',
    "task" VARCHAR(255) NOT NULL DEFAULT '',
    "url" VARCHAR(255) NOT NULL DEFAULT '',
    "reward" INTEGER NOT NULL,
    "assignedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Tasks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TasksUsers" (
    "user_id" VARCHAR(64) NOT NULL,
    "task_id" INTEGER NOT NULL,
    "task_status" VARCHAR(255) NOT NULL DEFAULT '',
    "assignedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TasksUsers_pkey" PRIMARY KEY ("user_id","task_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Tasks_id_key" ON "Tasks"("id");

-- CreateIndex
CREATE UNIQUE INDEX "TasksUsers_user_id_key" ON "TasksUsers"("user_id");

-- AddForeignKey
ALTER TABLE "Referals" ADD CONSTRAINT "Referals_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TasksUsers" ADD CONSTRAINT "TasksUsers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TasksUsers" ADD CONSTRAINT "TasksUsers_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "Tasks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
