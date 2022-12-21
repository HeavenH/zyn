-- CreateTable
CREATE TABLE "bosses" (
    "id" SERIAL NOT NULL,
    "body" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "achievementId" INTEGER NOT NULL,

    CONSTRAINT "bosses_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "bosses" ADD CONSTRAINT "bosses_achievementId_fkey" FOREIGN KEY ("achievementId") REFERENCES "achievement"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
