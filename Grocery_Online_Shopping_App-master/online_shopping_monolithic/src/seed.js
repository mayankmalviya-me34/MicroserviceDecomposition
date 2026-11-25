// Seed script for MERN Monolithic (amazon_demo database)
// Run with: mongo amazon_demo /tmp/seed.js

db = db.getSiblingDB('amazon_demo');

// Clear existing so this script is safe to re-run
db.products.deleteMany({});
db.customers.deleteMany({});

var result = db.products.insertMany([
  {name:"alphonso mango", desc:"great Quality of Mango", type:"fruits", banner:"http://codergogoi.com/youtube/images/alphonso.jpeg", unit:1, price:300, available:true, suplier:"Golden seed firming"},
  {name:"Apples", desc:"great Quality of Apple", type:"fruits", banner:"http://codergogoi.com/youtube/images/apples.jpeg", unit:1, price:140, available:true, suplier:"Golden seed firming"},
  {name:"Kesar Mango", desc:"great Quality of Mango", type:"fruits", banner:"http://codergogoi.com/youtube/images/kesar.jpeg", unit:1, price:170, available:true, suplier:"Golden seed firming"},
  {name:"Langra Mango", desc:"great Quality of Mango", type:"fruits", banner:"http://codergogoi.com/youtube/images/langra.jpeg", unit:1, price:280, available:true, suplier:"Golden seed firming"},
  {name:"Broccoli", desc:"great Quality of Fresh Vegetable", type:"vegetables", banner:"http://codergogoi.com/youtube/images/broccoli.jpeg", unit:1, price:280, available:true, suplier:"Golden seed firming"},
  {name:"Cauliflower", desc:"great Quality of Fresh Vegetable", type:"vegetables", banner:"http://codergogoi.com/youtube/images/cauliflower.jpeg", unit:1, price:280, available:true, suplier:"Golden seed firming"},
  {name:"Olive Oil", desc:"great Quality of Oil", type:"oils", banner:"http://codergogoi.com/youtube/images/oliveoil.jpg", unit:1, price:400, available:true, suplier:"Golden seed firming"}
]);

var productIds = [];
for (var key in result.insertedIds) {
  productIds.push(result.insertedIds[key]);
}
var firstProductId = productIds[0];

db.customers.insertOne({
  _id: ObjectId("6a5caea579a531531cf8dfd8"),
  email: "test@test.com",
  password: "seeded-placeholder",
  salt: "seeded-placeholder",
  phone: "9999999999",
  address: [],
  cart: [],
  wishlist: [firstProductId],
  orders: []
});

print("Seed complete.");
print("Products inserted: " + productIds.length);
print("Customer seeded with _id 6a5caea579a531531cf8dfd8, wishlist -> product " + firstProductId);