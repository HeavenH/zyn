/*
  Warnings:

  - Added the required column `name` to the `achievement` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `cinder` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "achievement" ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "cinder" ADD COLUMN     "username" TEXT NOT NULL;
