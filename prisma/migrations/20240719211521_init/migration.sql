-- DropIndex
DROP INDEX "TasksUsers_user_id_key";

-- AlterTable
ALTER TABLE "Tasks" ADD COLUMN     "rewardType" VARCHAR(255) NOT NULL DEFAULT 'coin';
