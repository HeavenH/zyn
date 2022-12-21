/*
  Warnings:

  - You are about to drop the `Cinder` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "achievement" DROP CONSTRAINT "achievement_cinderId_fkey";

-- DropTable
DROP TABLE "Cinder";

-- CreateTable
CREATE TABLE "cinder" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "cinder_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "achievement" ADD CONSTRAINT "achievement_cinderId_fkey" FOREIGN KEY ("cinderId") REFERENCES "cinder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
