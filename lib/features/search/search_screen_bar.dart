import 'package:flutter/material.dart';

import 'custom_bottom_nav_bar.dart';



class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),


              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Explore',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        suffixIcon: const Icon(Icons.cancel, color: Colors.grey),
                        filled: true,
                        fillColor: const Color(0xFFF2F2F2),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xff0E0AB1)),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xff0E0AB1)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),


            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}