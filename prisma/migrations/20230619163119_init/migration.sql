/*
  Warnings:

  - You are about to drop the `DVD` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "DVD";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Movie" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "copies" INTEGER NOT NULL,
    "director" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "materialTypeId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Movie_materialTypeId_fkey" FOREIGN KEY ("materialTypeId") REFERENCES "MaterialType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
