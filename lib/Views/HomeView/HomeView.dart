import 'package:flutter/material.dart';
import 'package:sayHI/Views/HomeView/sections/ExamplesSection.dart';
import 'package:sayHI/Views/HomeView/sections/FooterSection.dart';
import 'package:sayHI/Views/HomeView/sections/HeroSection.dart';
import 'package:sayHI/Views/HomeView/sections/PricingSection.dart';

import 'sections/WhyUsSection.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          HeroSection(),
          WhyUsSection(),
          ExamplesSection(),
          PricingSection(),
          FooterSection()
        ],
      ),
    );
  }
}
