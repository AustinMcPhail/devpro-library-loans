/*
  Warnings:

  - You are about to drop the column `lateFee` on the `Magazine` table. All the data in the column will be lost.
  - You are about to drop the column `materialType` on the `Magazine` table. All the data in the column will be lost.
  - You are about to drop the column `maximumLoanDays` on the `Magazine` table. All the data in the column will be lost.
  - You are about to drop the column `lateFee` on the `DVD` table. All the data in the column will be lost.
  - You are about to drop the column `materialType` on the `DVD` table. All the data in the column will be lost.
  - You are about to drop the column `maximumLoanDays` on the `DVD` table. All the data in the column will be lost.
  - You are about to drop the column `lateFee` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the column `materialType` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the column `maximumLoanDays` on the `Book` table. All the data in the column will be lost.
  - Added the required column `materialTypeId` to the `Magazine` table without a default value. This is not possible if the table is not empty.
  - Added the required column `materialTypeId` to the `DVD` table without a default value. This is not possible if the table is not empty.
  - Added the required column `materialTypeId` to the `Book` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "MaterialType" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "daysCanBeLoaned" INTEGER NOT NULL,
    "lateFee" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Loan" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "materialId" TEXT NOT NULL,
    "materialType" TEXT NOT NULL,
    "dueDate" DATETIME NOT NULL,
    "returned" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Loan_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Loan_materialId_fkey" FOREIGN KEY ("materialId") REFERENCES "MaterialType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Magazine" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "copies" INTEGER NOT NULL,
    "series" TEXT NOT NULL,
    "volume" INTEGER NOT NULL,
    "materialTypeId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Magazine_materialTypeId_fkey" FOREIGN KEY ("materialTypeId") REFERENCES "MaterialType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Magazine" ("copies", "createdAt", "id", "series", "title", "updatedAt", "volume") SELECT "copies", "createdAt", "id", "series", "title", "updatedAt", "volume" FROM "Magazine";
DROP TABLE "Magazine";
ALTER TABLE "new_Magazine" RENAME TO "Magazine";
CREATE TABLE "new_DVD" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "copies" INTEGER NOT NULL,
    "director" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "materialTypeId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "DVD_materialTypeId_fkey" FOREIGN KEY ("materialTypeId") REFERENCES "MaterialType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_DVD" ("copies", "createdAt", "director", "genre", "id", "title", "updatedAt") SELECT "copies", "createdAt", "director", "genre", "id", "title", "updatedAt" FROM "DVD";
DROP TABLE "DVD";
ALTER TABLE "new_DVD" RENAME TO "DVD";
CREATE TABLE "new_Book" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "copies" INTEGER NOT NULL,
    "materialTypeId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Book_materialTypeId_fkey" FOREIGN KEY ("materialTypeId") REFERENCES "MaterialType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Book" ("author", "copies", "createdAt", "genre", "id", "title", "updatedAt") SELECT "author", "copies", "createdAt", "genre", "id", "title", "updatedAt" FROM "Book";
DROP TABLE "Book";
ALTER TABLE "new_Book" RENAME TO "Book";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
