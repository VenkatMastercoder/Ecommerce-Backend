const express = require("express");
const { PrismaClient } = require("@prisma/client");

const app = express();

// this middleware help to Parse the Json Data in THE Req Body
app.use(express.json());

// Prisma Client Init
const prisma = new PrismaClient();

app.get("/products", async (req, res) => {
  // Prisma there is FindMany()
  const productData = await prisma.product.findMany();
  res.json({ products: productData });
});

app.get("/products/:id", async (req, res) => {
  const { id } = req.params;
 
  const ProductDetailsData = await prisma.productDetail.findUnique({
    where: { product_id: parseInt(id) },
  });

  res.json({ ...ProductDetailsData });
});

app.post("/products", async (req, res) => {
  const data = req.body;
  const { title, price, image_url, rating } = data;

  const newProduct = await prisma.product.create({
    data: {
      title,
      price,
      image_url,
      rating,
    },
  });

  res.json({ message: "Product created Sucessfully", data: newProduct });
});

app.post("/product-detail", async (req, res) => {
  const data = req.body;
  const {
    image_url,
    title,
    style,
    price,
    description,
    brand,
    total_reviews,
    rating,
    availability,
    product_id,
  } = data;

  const newProduct = await prisma.productDetail.create({
    data: {
      image_url,
      title,
      style,
      price,
      description,
      brand,
      total_reviews,
      rating,
      availability,
      product_id,
    },
  });

  res.json({ message: "Product created Sucessfully", data: newProduct });
});

app.post("/similar-product", async (req, res) => {
  const data = req.body;

  const {
    image_url,
    title,
    style,
    price,
    description,
    brand,
    total_reviews,
    rating,
    availability,
    product_id,
  } = data;

  const newProduct = await prisma.similarProducts.create({
    data: {
      image_url,
      title,
      style,
      price,
      description,
      brand,
      total_reviews,
      rating,
      availability,
      product_id,
    },
  });

  res.json({ message: "Product created Sucessfully", data: newProduct });
});

app.listen(3000, () => {
  console.log("Server is Running on Port:3000");
});
