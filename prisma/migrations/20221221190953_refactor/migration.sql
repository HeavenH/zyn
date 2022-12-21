/*
  Warnings:

  - You are about to drop the column `createdAt` on the `achievement` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `achievement` table. All the data in the column will be lost.
  - You are about to drop the `boss` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cinder` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "achievement" DROP CONSTRAINT "achievement_cinderId_fkey";

-- DropForeignKey
ALTER TABLE "boss" DROP CONSTRAINT "boss_achievementId_fkey";

-- AlterTable
ALTER TABLE "achievement" DROP COLUMN "createdAt",
DROP COLUMN "name";

-- DropTable
DROP TABLE "boss";

-- DropTable
DROP TABLE "cinder";

-- CreateTable
CREATE TABLE "Cinder" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "Cinder_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "achievement" ADD CONSTRAINT "achievement_cinderId_fkey" FOREIGN KEY ("cinderId") REFERENCES "Cinder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
