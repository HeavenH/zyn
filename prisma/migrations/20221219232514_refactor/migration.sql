/*
  Warnings:

  - You are about to drop the column `achievementId` on the `cinder` table. All the data in the column will be lost.
  - Added the required column `cinderId` to the `achievement` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "cinder" DROP CONSTRAINT "cinder_achievementId_fkey";

-- AlterTable
ALTER TABLE "achievement" ADD COLUMN     "cinderId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "cinder" DROP COLUMN "achievementId";

-- AddForeignKey
ALTER TABLE "achievement" ADD CONSTRAINT "achievement_cinderId_fkey" FOREIGN KEY ("cinderId") REFERENCES "cinder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
