import 'package:flutter/material.dart';
import 'package:iti_grad_project/core/constants/app_assets.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),

      child: Stack(
        children: [
          Image.asset(
            AppAssets.offer,
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 15,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Get Winter Discount",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "20% Off",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "For Children",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/child.png",
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}