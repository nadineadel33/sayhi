import 'package:flutter/material.dart';
import 'package:sayHI/Views/HomeView/widgets/EclipseContainer.dart';
import 'package:sayHI/GlobalWidgets/GlassContainer.dart';
import 'package:sayHI/Views/HomeView/widgets/SliderGlassWidget.dart';

class ExamplesSection extends StatefulWidget {
  const ExamplesSection({Key? key}) : super(key: key);

  @override
  _ExamplesSectionState createState() => _ExamplesSectionState();
}

class _ExamplesSectionState extends State<ExamplesSection> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;

    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // Background Image
          Center(
            child: Image.asset(
              'Assets/images/background02.jpg',  // Updated asset path
              width: width,
              fit: BoxFit.fill,
            ),
          ),
          // Overlay
          Container(
            width: width,
            height: height,
            color: Colors.black.withOpacity(0.8),
          ),
          // Positioned Eclipse Containers
          Positioned(top: 0, left: 0, child: EclipseContainer()),
          Positioned(bottom: 0, right: 0, child: EclipseContainer()),

          // Main Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              // Title
              const Center(
                child: Text(
                  'Explore Our Features',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Scrollable Row
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlassContainer(
                      width: 400,
                      height: 500,
                      blur: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 5),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Feature \nShowcase',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(flex: 4),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'Assets/icons/AppSymbol.png', // Updated asset path
                              width: 50,
                            ),
                          ),
                          const Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ),

                  // Horizontal Scrolling Cards
                  SizedBox(
                    width: 1000,
                    height: 500,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        _scrollController.jumpTo(
                          _scrollController.offset - details.delta.dx,
                        );
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _scrollController,
                        child: const Row(
                          children: [
                            SliderGlassWidget(
                              title: 'Chat Interface',
                              image: 'Assets/icons/AppSymbol.png', // Updated asset
                            ),
                            SliderGlassWidget(
                              title: 'User Profiles',
                              image: 'Assets/icons/AppSymbol.png', // Updated asset
                            ),
                            SliderGlassWidget(
                              title: 'Voice Messages',
                              image: 'Assets/icons/AppSymbol.png', // Updated asset
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'Assets/icons/mouseIcon.png', // Updated asset path
                  width: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
