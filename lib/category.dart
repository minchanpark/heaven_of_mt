import 'package:flutter/material.dart';

import '../choi/choi_game_page.dart';
import '../four/four_game_page.dart';
import '../person/person_game_page.dart';
import '../tele/tele_game_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectedCategory = -1;

  void _handleHover(int category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _handleClick(int category) {
    switch (category) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChoiGamePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FourGamePage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PersonGamePage()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TeleGamePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.056),
              Container(
                margin:
                    EdgeInsets.only(left: width * 0.084, right: width * 0.084),
                child: Image.asset(
                  'assets/images/title.png',
                  width: width * 0.15,
                  height: height * 0.038,
                ),
              ),
              SizedBox(height: height * 0.17),
              Container(
                margin: EdgeInsets.only(left: width * 0.085),
                child: Row(
                  children: [
                    _buildCategoryWidget(
                      category: 1,
                      label: "1990년대",
                      width: width,
                      height: height,
                    ),
                    SizedBox(width: width * 0.024),
                    _buildCategoryWidget(
                      category: 2,
                      label: "2000년대",
                      width: width,
                      height: height,
                    ),
                    SizedBox(width: width * 0.024),
                    _buildCategoryWidget(
                      category: 3,
                      label: "2010년대",
                      width: width,
                      height: height,
                    ),
                    SizedBox(width: width * 0.024),
                    _buildCategoryWidget(
                      category: 4,
                      label: "2020년대",
                      width: width,
                      height: height,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryWidget({
    required int category,
    required String label,
    required double width,
    required double height,
  }) {
    return MouseRegion(
      onEnter: (_) => _handleHover(category),
      onExit: (_) => _handleHover(-1),
      child: GestureDetector(
        onTap: () => _handleClick(category),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: width * 0.19,
              height: height * 0.56,
              child: Image.asset(
                selectedCategory == category
                    ? 'assets/images/category2.png'
                    : 'assets/images/category.png',
                fit: BoxFit.fill,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'DungGeunMo',
                fontSize: 40,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
