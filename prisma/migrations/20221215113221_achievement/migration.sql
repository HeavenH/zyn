/*
  Warnings:

  - You are about to drop the `Cinder` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Cinder";

-- CreateTable
CREATE TABLE "cinder" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "cinder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "achievement" (
    "id" SERIAL NOT NULL,
    "body" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cinderId" INTEGER NOT NULL,

    CONSTRAINT "achievement_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "achievement" ADD CONSTRAINT "achievement_cinderId_fkey" FOREIGN KEY ("cinderId") REFERENCES "cinder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
