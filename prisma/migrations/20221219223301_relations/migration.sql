/*
  Warnings:

  - You are about to drop the column `cinderId` on the `achievement` table. All the data in the column will be lost.
  - Added the required column `achievementId` to the `cinder` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "achievement" DROP CONSTRAINT "achievement_cinderId_fkey";

-- AlterTable
ALTER TABLE "achievement" DROP COLUMN "cinderId";

-- AlterTable
ALTER TABLE "cinder" ADD COLUMN     "achievementId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "cinder" ADD CONSTRAINT "cinder_achievementId_fkey" FOREIGN KEY ("achievementId") REFERENCES "achievement"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
