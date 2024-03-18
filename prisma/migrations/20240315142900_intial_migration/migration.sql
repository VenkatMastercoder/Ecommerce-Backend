-- CreateTable
CREATE TABLE "Product" (
    "product_id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "image_url" TEXT NOT NULL,
    "rating" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "ProductDetail" (
    "product_detail_id" SERIAL NOT NULL,
    "image_url" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "style" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "brand" TEXT NOT NULL,
    "total_reviews" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "availability" TEXT NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "ProductDetail_pkey" PRIMARY KEY ("product_detail_id")
);

-- CreateTable
CREATE TABLE "SimilarProducts" (
    "id" SERIAL NOT NULL,
    "image_url" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "style" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "brand" TEXT NOT NULL,
    "total_reviews" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "availability" TEXT NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "SimilarProducts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ProductDetail_product_id_key" ON "ProductDetail"("product_id");

-- CreateIndex
CREATE UNIQUE INDEX "SimilarProducts_product_id_key" ON "SimilarProducts"("product_id");

-- AddForeignKey
ALTER TABLE "ProductDetail" ADD CONSTRAINT "ProductDetail_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SimilarProducts" ADD CONSTRAINT "SimilarProducts_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "ProductDetail"("product_detail_id") ON DELETE RESTRICT ON UPDATE CASCADE;
