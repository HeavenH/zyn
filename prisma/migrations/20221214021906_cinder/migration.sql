-- CreateTable
CREATE TABLE "Cinder" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Cinder_pkey" PRIMARY KEY ("id")
);
