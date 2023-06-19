-- CreateTable
CREATE TABLE "Book" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "copies" INTEGER NOT NULL,
    "maximumLoanDays" INTEGER NOT NULL,
    "lateFee" INTEGER NOT NULL,
    "materialType" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Magazine" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "series" TEXT NOT NULL,
    "volume" INTEGER NOT NULL,
    "copies" INTEGER NOT NULL,
    "maximumLoanDays" INTEGER NOT NULL,
    "lateFee" INTEGER NOT NULL,
    "materialType" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "DVD" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "director" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "copies" INTEGER NOT NULL,
    "maximumLoanDays" INTEGER NOT NULL,
    "lateFee" INTEGER NOT NULL,
    "materialType" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
