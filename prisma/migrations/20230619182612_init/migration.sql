/*
  Warnings:

  - You are about to drop the column `materialType` on the `Loan` table. All the data in the column will be lost.
  - Added the required column `materialTypeId` to the `Loan` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Loan" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "materialId" TEXT NOT NULL,
    "materialTypeId" TEXT NOT NULL,
    "dueDate" DATETIME NOT NULL,
    "returned" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Loan_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Loan_materialTypeId_fkey" FOREIGN KEY ("materialTypeId") REFERENCES "MaterialType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Loan" ("createdAt", "dueDate", "id", "materialId", "returned", "updatedAt", "userId") SELECT "createdAt", "dueDate", "id", "materialId", "returned", "updatedAt", "userId" FROM "Loan";
DROP TABLE "Loan";
ALTER TABLE "new_Loan" RENAME TO "Loan";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
