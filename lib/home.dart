import 'package:flutter/material.dart';
import 'Egyptian1.dart';
import 'Western1.dart';
import 'Desserts1.dart';
import 'Beverages1.dart';
import 'settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2B09E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/slt.png',
                            width: 48,
                            height: 48,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Order your favourite food',
                          style: TextStyle(
                            fontFamily: 'Lobster',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/user.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search....',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SettingsScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryChip(context, 'ALL', selected: true),
                      _buildCategoryChip(context, 'Western'),
                      _buildCategoryChip(context, 'Egyptian'),
                      _buildCategoryChip(context, 'Desserts'),
                      _buildCategoryChip(context, 'Beverages'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  children: [
                    _buildFoodCard('assets/beefburger.png', 'Beef Burger'),
                    _buildFoodCard('assets/warakenab.png', 'Warak Enab\n(Grape Leaves)'),
                    _buildFoodCard('assets/falafel.png', 'Falafel'),
                    _buildFoodCard('assets/kunafa.jpeg', 'Kunafa'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, {bool selected = false}) {
    Widget chip = Chip(
      label: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: selected ? Colors.red : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );

    switch (label) {
      case 'Western':
        return _buildChipWithNavigation(context, chip, Western1Screen());
      case 'Egyptian':
        return _buildChipWithNavigation(context, chip, Egyptian1Screen());
      case 'Desserts':
        return _buildChipWithNavigation(context, chip, Desserts1Screen());
      case 'Beverages':
        return _buildChipWithNavigation(context, chip, Beverages1Screen());
      default:
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: chip,
        );
    }
  }

  Widget _buildChipWithNavigation(BuildContext context, Widget chip, Widget screen) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen)),
        child: chip,
      ),
    );
  }

  Widget _buildFoodCard(String imagePath, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Lobster',
                color: Colors.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
