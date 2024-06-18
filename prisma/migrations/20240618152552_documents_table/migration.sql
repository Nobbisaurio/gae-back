-- CreateTable
CREATE TABLE "Documents" (
    "id" SERIAL NOT NULL,
    "process" TEXT NOT NULL,
    "docName" TEXT NOT NULL,
    "version" TEXT NOT NULL DEFAULT '1.0',
    "elaborationDate" TEXT NOT NULL,
    "updateDate" TEXT NOT NULL,
    "code" TEXT NOT NULL,

    CONSTRAINT "Documents_pkey" PRIMARY KEY ("id")
);
