import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game_musictitle.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectedCategory = -1;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

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
          MaterialPageRoute(
              builder: (context) =>
                  const MusicTitleWebGame(generation: '1990')),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const MusicTitleWebGame(generation: '2000')),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const MusicTitleWebGame(generation: '2010')),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const MusicTitleWebGame(generation: '2020')),
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
                image: AssetImage('assets/images/background_final.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          RawKeyboardListener(
            focusNode: focusNode,
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.escape) {
                  Navigator.of(context).pop();
                }
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.056),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: width * 0.084, right: width * 0.084),
                    child: Image.asset(
                      'assets/images/title.png',
                      width: width * 0.15,
                      height: height * 0.038,
                    ),
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
