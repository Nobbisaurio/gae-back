-- CreateTable
CREATE TABLE "StructuredCores" (
    "id" SERIAL NOT NULL,
    "careerCode" TEXT NOT NULL,
    "careerLevel" TEXT NOT NULL,
    "coreName" TEXT NOT NULL,

    CONSTRAINT "StructuredCores_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "StructuredCores_careerCode_key" ON "StructuredCores"("careerCode");
