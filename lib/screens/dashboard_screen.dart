import 'package:flutter/material.dart';
import 'package:lakbay/components/custom_appbar.dart';
import 'package:lakbay/components/custom_navbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  int selectedCategoryIndex = 0;

  final List<String> categories = ["Adventures", "Stays", "Attractions"];

  final List<Map<String, String>> touristSpots = [
    {
      "image": "assets/images/elnido.jpeg",
      "title": "El Nido",
      "subtitle": "Palawan, Philippines",
      "rating": "4.9",
    },
    {
      "image": "assets/images/sugbalagoon.jpg",
      "title": "Sugba Lagoon",
      "subtitle": "Siargao, Philippines",
      "rating": "4.8",
    },
    {
      "image": "assets/images/chocohills.jpg",
      "title": "Chocolate Hills",
      "subtitle": "Bohol, Philippines",
      "rating": "4.8",
    },
    {
      "image": "assets/images/calle.jpg",
      "title": "Calle Crisologo",
      "subtitle": "Vigan, Ilocos",
      "rating": "4.7",
    },
    {
      "image": "assets/images/mines.jpg",
      "title": "Mines View",
      "subtitle": "Baguio City",
      "rating": "4.6",
    },
  ];

  final List<Map<String, String>> topDestinations = [
    {"image": "assets/images/arawak.jpg", "title": "Arawak", "loc": "Luzon"},
    {"image": "assets/images/verona.jpg", "title": "Verona", "loc": "Luzon"},
    {"image": "assets/images/marinduque.jpg", "title": "Marinduque", "loc": "Luzon"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3E7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: CustomAppBar(),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// CATEGORY CAROUSEL
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, index) {
                    final bool isSelected = selectedCategoryIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index; // update selected category
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xffE6ECE2)
                              : Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.green.shade800),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.explore,
                              size: 18,
                              color: Colors.green.shade800,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              categories[index],
                              style: TextStyle(
                                fontFamily: "Fraunces",
                                fontSize: 16,
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),


              const SizedBox(height: 20),

              /// TOURIST SPOTS CAROUSEL
              Row(
                children: [
                  const Text(
                    "TOP DESTINATIONS",
                    style: TextStyle(
                      fontFamily: "Fraunces",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Color(0xff27533E),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade800,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.more_horiz, color: Colors.white, size: 22),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 310,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: touristSpots.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 20),
                  itemBuilder: (_, index) {
                    final spot = touristSpots[index];
                    return GestureDetector(
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage(spot["image"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 15,
                              left: 15,
                              right: 15,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      spot["title"]!,
                                      style: const TextStyle(
                                        fontFamily: "Fraunces",
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      spot["subtitle"]!,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 75),

              /// TOP DESTINATIONS HEADER
              Row(
                children: [
                  const Text(
                    "POPULAR PLACES",
                    style: TextStyle(
                      fontFamily: "Fraunces",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Color(0xff27533E),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade800,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.more_horiz, color: Colors.white, size: 22),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              /// TOP DESTINATIONS CARDS
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemCount: topDestinations.length,
                  itemBuilder: (_, index) {
                    final top = topDestinations[index];
                    return Container(
                      width: 190,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xffCFE5AA),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              top["image"]!,
                              width: 55,
                              height: 55,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                top["title"]!,
                                style: const TextStyle(
                                  fontFamily: "Fraunces",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                top["loc"]!,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),

      /// CUSTOM NAVBAR
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (i) => setState(() => selectedIndex = i),
      ),
    );
  }
}
