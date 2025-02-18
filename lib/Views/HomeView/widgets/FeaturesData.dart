import 'package:flutter/material.dart';
import 'package:sayHI/Views/HomeView/widgets/FeatuersData.dart';

class FeaturesDataSecondColumn extends StatelessWidget {
  const FeaturesDataSecondColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeaturesData(
          title: 'Real-time Sign Translation',
          subTitle: 'Instantly convert sign language gestures into text or speech.',
          image: 'Assets/icons/code.png', // Keeping the same icon
        ),
        SizedBox(height: 10),
        FeaturesData(
          title: 'Save and Share Translations',
          subTitle: 'Easily save translated text and share it via email or social media.',
          image: 'Assets/icons/save.png', // Keeping the same icon
        ),
      ],
    );
  }
}

class FeaturesDataFirstColumn extends StatelessWidget {
  const FeaturesDataFirstColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeaturesData(
          title: 'Accurate Sign Recognition',
          subTitle:
              'Utilizes advanced AI to detect and interpret sign language with high accuracy.',
          image: 'Assets/icons/accurecy.png', // Keeping the same icon
        ),
        SizedBox(height: 10),
        FeaturesData(
          title: 'Data Security',
          subTitle: 'Ensures user data privacy, keeping translations secure and confidential.',
          image: 'Assets/icons/cloud.png', // Keeping the same icon
        ),
      ],
    );
  }
}
