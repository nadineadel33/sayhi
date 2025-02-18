import 'package:flutter/material.dart';

class PricingCard extends StatefulWidget {
  const PricingCard({
    super.key,
    required this.width,
    required this.height,
    required this.planeName,
    required this.subtitle,
    required this.price,
    required this.features,
    required this.bgColor,
    required this.textColor,
  });

  final double width;
  final double height;
  final String planeName;
  final String subtitle;
  final String price;
  final List<String> features;
  final Color bgColor;
  final Color textColor;

  @override
  _PricingCardState createState() => _PricingCardState();
}

class _PricingCardState extends State<PricingCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(16.0),
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.05)) //
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: widget.bgColor.withOpacity(_isHovered ? 0.95 : 1),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.3 : 0.15),
              blurRadius: _isHovered ? 14.0 : 6.0,
              spreadRadius: _isHovered ? 3.0 : 1.0,
            ),
          ],
        ),
        child: SizedBox(
          height: widget.height - 32, // Ensure proper layout
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // **Top Icon**
              Center(
                child: Image.asset(
                  'assets/icons/app_symbol_gray_color.png', // ✅ Ensure correct path
                  color: widget.textColor,
                  height: 40,
                ),
              ),
              const SizedBox(height: 16.0),

              // **Title**
              Text(
                widget.planeName,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: widget.textColor,
                ),
              ),
              const SizedBox(height: 4.0),

              // **Subtitle**
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 16.0,
                  color: widget.textColor.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 16.0),

              // **Price**
              Row(
                children: [
                  Text(
                    "\$${widget.price}",
                    style: TextStyle(
                      fontSize: 36.0,
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " / per month",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: widget.textColor.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // **CTA Button**
              Center(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: widget.bgColor,
                      backgroundColor: widget.textColor,
                      side: BorderSide(color: widget.textColor.withOpacity(0.5)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                    ),
                    child: const Text("Get Started"),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // **Divider**
              const Divider(color: Colors.grey),
              const SizedBox(height: 16.0),

              // **Features Title**
              Text(
                "Features",
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),

              // **Scrollable Feature List**
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.features.length,
                  itemBuilder: (context, index) {
                    return FeatureItem(
                      text: widget.features[index],
                      color: widget.textColor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;
  final Color color;

  const FeatureItem({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: color.withOpacity(0.7),
            size: 20,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: color.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
