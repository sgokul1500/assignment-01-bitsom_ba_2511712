// Connect to database
use("ecommerce")

// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
{
  _id: "P1001",
  name: "Samsung Galaxy S23",
  category: "Electronics",
  price: 75000,
  brand: "Samsung",
  warranty_years: 1,
  specifications: { ram: "8GB", storage: "256GB", voltage: "220V" },
  features: ["5G", "AMOLED Display", "Fast Charging"]
},
{
  _id: "P2001",
  name: "Men's Casual Shirt",
  category: "Clothing",
  price: 1499,
  brand: "Allen Solly",
  sizes_available: ["S","M","L","XL"],
  material: "Cotton",
  attributes: { color: "Blue", fit: "Regular", sleeve: "Full" }
},
{
  _id: "P3001",
  name: "Organic Almond Milk",
  category: "Groceries",
  price: 350,
  brand: "Urban Platter",
  expiry_date: new Date("2024-12-31"),
  nutrition: { calories: 60, protein: "1g", fat: "2.5g" },
  ingredients: ["Almonds","Water","Natural Flavour"]
}
])


// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
})


// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
})


// OP4: updateOne() — add a "discount_percent" field to a specific product

db.products.updateOne(
  { _id: "P1001" },
  { $set: { discount_percent: 10 } }
)


// OP5: createIndex() — create an index on category field

db.products.createIndex({ category: 1 })

// This index improves query performance when filtering products by category,
// which is a common operation in e-commerce applications.