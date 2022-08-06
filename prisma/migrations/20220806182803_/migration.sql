/*
  Warnings:

  - You are about to drop the column `access_token` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `expires_at` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `id_token` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `provider` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `refresh_token` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `scope` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `session_state` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `token_type` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `Account` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[providerId,providerAccountId]` on the table `Account` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[accessToken]` on the table `Session` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `providerId` to the `Account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `providerType` to the `Account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `accessToken` to the `Session` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Session` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Account_provider_providerAccountId_key` ON `Account`;

-- AlterTable
ALTER TABLE `Account` DROP COLUMN `access_token`,
    DROP COLUMN `expires_at`,
    DROP COLUMN `id_token`,
    DROP COLUMN `provider`,
    DROP COLUMN `refresh_token`,
    DROP COLUMN `scope`,
    DROP COLUMN `session_state`,
    DROP COLUMN `token_type`,
    DROP COLUMN `type`,
    ADD COLUMN `accessToken` VARCHAR(191) NULL,
    ADD COLUMN `accessTokenExpires` DATETIME(3) NULL,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `providerId` VARCHAR(191) NOT NULL,
    ADD COLUMN `providerType` VARCHAR(191) NOT NULL,
    ADD COLUMN `refreshToken` VARCHAR(191) NULL,
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `Session` ADD COLUMN `accessToken` VARCHAR(191) NOT NULL,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `User` ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `password` VARCHAR(191) NULL,
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Account_providerId_providerAccountId_key` ON `Account`(`providerId`, `providerAccountId`);

-- CreateIndex
CREATE UNIQUE INDEX `Session_accessToken_key` ON `Session`(`accessToken`);
