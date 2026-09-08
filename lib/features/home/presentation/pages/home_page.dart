import 'package:flutter/material.dart';
import 'package:iti_grad_project/features/product_details/presentation/pages/product_details.dart';
import 'package:iti_grad_project/features/search/search_screen_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> featuredProducts = const [
    {
      "name": "Watch",
      "price": "\$40",
      "image": "assets/images/watch.png",
      "description": "Premium luxury analog watch with stainless steel strap and water resistance."
    },
    {
      "name": "Nike Shoes",
      "price": "\$430",
      "image": "assets/images/shoes1.jpeg",
      "description": "The Nike Shoes delivers classic street style with premium leather construction and air-cushioned comfort."
    },
    {
      "name": "Airpods",
      "price": "\$220",
      "image": "assets/images/airpods.jpg",
      "description": "Wireless earbuds with active noise cancellation and crystal clear audio quality."
    },
  ];

  final List<Map<String, String>> popularProducts = const [
    {
      "name": "LG TV",
      "price": "\$350",
      "image": "assets/images/lg.jpeg",
      "description": "Smart Ultra HD LED TV with vibrant display and built-in streaming apps."
    },
    {
      "name": "Hoodie",
      "price": "\$50",
      "image": "assets/images/hoodie.jpg",
      "description": "Comfortable cotton fleece hoodie designed for warmth and casual streetwear look."
    },
    {
      "name": "Jacket",
      "price": "\$400",
      "image": "assets/images/jacket.jpeg",
      "description": "Stylish windproof leather jacket with soft lining for winter season."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade300,
                        child: const Icon(Icons.person, color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Hello", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          Text("John William", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications_outlined, size: 24),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text("Search In Market", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF5C6AC4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Get Winter Discount", style: TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: 4),
                          Text("20% Off", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("For Children", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/child.png',
                      height: 80,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.child_care, size: 50, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Featured", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredProducts.length,
                  itemBuilder: (context, index) {
                    return _buildProductCard(context, featuredProducts[index]);
                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Most Popular", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularProducts.length,
                  itemBuilder: (context, index) {
                    return _buildProductCard(context, popularProducts[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, String> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              name: product["name"]!,
              price: product["price"]!,
              image: product["image"]!,
              description: product["description"]!,
            ),
          ),
        );
      },
      child: Container(
        width: 110,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  product["image"]!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["name"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product["price"]!,
                    style: const TextStyle(color: Color(0xFF5C6AC4), fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}