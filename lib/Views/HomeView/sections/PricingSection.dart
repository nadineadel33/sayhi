import 'package:flutter/material.dart';
import 'package:sayHI/Views/HomeView/widgets/EclipseContainer.dart';
import 'package:sayHI/Views/HomeView/widgets/PricingCard.dart';
import 'package:sayHI/Views/Pricing/CheckoutView.dart';

class PricingSection extends StatefulWidget {
  const PricingSection({super.key});

  @override
  _PricingSectionState createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
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

  void _navigateToCheckout(String planName, String price) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutView(planName: planName, price: price),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;

    return Container(
      width: width,
      height: height * 1.4,
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // Background Image
          Center(
            child: Image.asset(
              'assets/images/background07.jpg', // Updated asset path
              width: width,
              fit: BoxFit.fitWidth,
            ),
          ),
          // Dark Overlay
          Container(
            width: width,
            height: height,
            color: Colors.black.withOpacity(0.5),
          ),
          Positioned(bottom: 0, right: 0, child: EclipseContainer()),

          // Pricing Cards Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * .8,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const SweepGradient(
                    colors: [
                      Color(0xff091e3a),
                      Color(0xff115bbf),
                      Color(0xff091e3a),
                    ],
                    stops: [0, 0.5, 1],
                    center: Alignment.topRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.06),
                      const Text(
                        'Choose a Plan That Works for You',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(height: height * 0.03),

                      // Pricing Cards
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 2),

                          // Basic Plan
                          GestureDetector(
                            onTap: () => _navigateToCheckout('Basic', '20'),
                            child: PricingCard(
                              width: width * .19,
                              height: height * .65,
                              planeName: 'Basic',
                              subtitle: 'Best for personal use.',
                              price: '20',
                              features: const [
                                'File storage',
                                'Advanced analytics',
                                '60 photo import',
                              ],
                              bgColor: Colors.white,
                              textColor: Colors.black,
                            ),
                          ),
                          const Spacer(flex: 1),

                          // Enterprise Plan
                          GestureDetector(
                            onTap: () => _navigateToCheckout('Enterprise', '120'),
                            child: PricingCard(
                              width: width * .19,
                              height: height * .7,
                              planeName: 'Enterprise',
                              subtitle: 'For large teams & corporations.',
                              price: '120',
                              features: const [
                                '120 photo import',
                                'Resource scheduling',
                                'Team collaboration',
                                'Advanced analytics',
                              ],
                              bgColor: Colors.black,
                              textColor: Colors.white,
                            ),
                          ),
                          const Spacer(flex: 1),

                          // Business Plan
                          GestureDetector(
                            onTap: () => _navigateToCheckout('Business', '50'),
                            child: PricingCard(
                              width: width * .2,
                              height: height * .74,
                              planeName: 'Business',
                              subtitle: 'Best for business owners.',
                              price: '50',
                              features: const [
                                'Unlimited photo import',
                                'Client meeting schedule',
                                'Compliance tracking',
                                'Client communication',
                                'Custom reports tailored',
                              ],
                              bgColor: Colors.white,
                              textColor: Colors.black,
                            ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
