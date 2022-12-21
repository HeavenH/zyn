/*
  Warnings:

  - You are about to drop the `_AchievementToCinder` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `cinderId` to the `achievement` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_AchievementToCinder" DROP CONSTRAINT "_AchievementToCinder_A_fkey";

-- DropForeignKey
ALTER TABLE "_AchievementToCinder" DROP CONSTRAINT "_AchievementToCinder_B_fkey";

-- AlterTable
ALTER TABLE "achievement" ADD COLUMN     "cinderId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "_AchievementToCinder";

-- AddForeignKey
ALTER TABLE "achievement" ADD CONSTRAINT "achievement_cinderId_fkey" FOREIGN KEY ("cinderId") REFERENCES "cinder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
