/*
  Warnings:

  - You are about to drop the column `body` on the `achievement` table. All the data in the column will be lost.
  - You are about to drop the `bosses` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `name` to the `achievement` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "achievement" DROP CONSTRAINT "achievement_cinderId_fkey";

-- DropForeignKey
ALTER TABLE "bosses" DROP CONSTRAINT "bosses_achievementId_fkey";

-- AlterTable
ALTER TABLE "achievement" DROP COLUMN "body",
ADD COLUMN     "name" TEXT NOT NULL,
ALTER COLUMN "cinderId" DROP NOT NULL;

-- DropTable
DROP TABLE "bosses";

-- CreateTable
CREATE TABLE "boss" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "achievementId" INTEGER NOT NULL,

    CONSTRAINT "boss_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "achievement" ADD CONSTRAINT "achievement_cinderId_fkey" FOREIGN KEY ("cinderId") REFERENCES "cinder"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "boss" ADD CONSTRAINT "boss_achievementId_fkey" FOREIGN KEY ("achievementId") REFERENCES "achievement"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
