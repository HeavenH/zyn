/*
  Warnings:

  - You are about to drop the column `cinderId` on the `achievement` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "achievement" DROP CONSTRAINT "achievement_cinderId_fkey";

-- AlterTable
ALTER TABLE "achievement" DROP COLUMN "cinderId";

-- CreateTable
CREATE TABLE "_AchievementToCinder" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_AchievementToCinder_AB_unique" ON "_AchievementToCinder"("A", "B");

-- CreateIndex
CREATE INDEX "_AchievementToCinder_B_index" ON "_AchievementToCinder"("B");

-- AddForeignKey
ALTER TABLE "_AchievementToCinder" ADD CONSTRAINT "_AchievementToCinder_A_fkey" FOREIGN KEY ("A") REFERENCES "achievement"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AchievementToCinder" ADD CONSTRAINT "_AchievementToCinder_B_fkey" FOREIGN KEY ("B") REFERENCES "cinder"("id") ON DELETE CASCADE ON UPDATE CASCADE;
