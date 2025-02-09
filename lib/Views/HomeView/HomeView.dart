import 'package:sayHI/Views/HomeView/sections/FooterSection.dart';
import 'package:sayHI/Views/HomeView/sections/HeroSection.dart';
import 'package:sayHI/Views/HomeView/sections/ExamplesSection.dart';
import 'package:sayHI/Views/HomeView/sections/PricingSection.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'sections/WhyUsSection.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ItemScrollController _scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // **Background Color or Gradient**
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF000000), Color(0xFF1A1A1A)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // **Main Content**
          ScrollablePositionedList.builder(
            itemScrollController: _scrollController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                child: _buildSection(index),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSection(int index) {
    switch (index) {
      case 0:
        return const HeroSection();
      case 1:
        return const WhyUsSection();
      case 2:
        return const ExamplesSection();
      case 3:
        return const PricingSection();
      case 4:
        return const FooterSection();
      default:
        return const SizedBox.shrink();
    }
  }
}
