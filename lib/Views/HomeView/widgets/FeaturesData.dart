import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FeaturesData extends StatelessWidget {
  const FeaturesData({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    double width = ResponsiveValue<double>(
      context,
      defaultValue: 820.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 500.0),
        const Condition.largerThan(name: TABLET, value: 1100.0),
      ],
    ).value;

    double fontSize = ResponsiveValue<double>(
      context,
      defaultValue: 24.0,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: width * 0.026),
        Condition.equals(name: TABLET, value: width * 0.02),
        Condition.largerThan(name: TABLET, value: width * 0.027),
      ],
    ).value;

    double subTitleFontSize = fontSize / 2;
    double paddingSize = ResponsiveValue<double>(
      context,
      defaultValue: 8.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 4.0),
        const Condition.largerThan(name: TABLET, value: 12.0),
      ],
    ).value;

    double imageSize = ResponsiveValue<double>(
      context,
      defaultValue: 40.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 30.0),
        const Condition.largerThan(name: TABLET, value: 80.0),
      ],
    ).value;

    return SizedBox(
      width: width * 0.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(paddingSize),
            child: Image.asset(image, width: imageSize),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(paddingSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: subTitleFontSize,
                    ),
                    maxLines: 9,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturesDataSecondColumn extends StatelessWidget {
  const FeaturesDataSecondColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeaturesData(
          title: 'Instant Code Generation',
          subTitle:
              'Speed in processing images and generating code in a few seconds.',
          image: 'Assets/icons/code.png',
        ),
        FeaturesData(
          title: 'Save and share codes',
          subTitle:
              'The ability to save and easily share extracted codes via email or social media',
          image: 'Assets/icons/save.png',
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
          title: 'Accurate image analysis',
          subTitle:
              'Use advanced artificial intelligence techniques to analyze images with high accuracy and extract the appropriate software code.',
          image: 'Assets/icons/accurecy.png',
        ),
        FeaturesData(
          title: 'Data Security',
          subTitle:
              'Emphasize the protection of users data and images and ensure that they are not used for unauthorized purposes.',
          image: 'Assets/icons/cloud.png',
        ),
      ],
    );
  }
}
