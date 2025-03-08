import 'package:flutter/material.dart';

class CampaignView extends StatelessWidget {
  const CampaignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campaigns'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Muted Campaigns Section
            _buildCategorySection(
              title: "Muted Campaigns",
              campaigns: [
                _buildCampaignCard(
                  title: "Support for Muted People in Egypt “Dawwie”",
                  description:
                  "Helping muted individuals in Egypt get better communication tools and support.",
                  imagePath: "Assets/images/muted_egypt.jpg",
                ),
                _buildCampaignCard(
                  title: "International Support for Muted People",
                  description:
                  "A global initiative to empower and assist muted individuals worldwide.",
                  imagePath: "Assets/images/muted_global.jpg",
                ),
              ],
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  // Category Section Builder
  Widget _buildCategorySection({required String title, required List<Widget> campaigns}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 10),
        ...campaigns, // Display all campaign cards in this category
      ],
    );
  }

  // Campaign Card Builder
  Widget _buildCampaignCard({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imagePath, height: 150, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to a detailed campaign page (if implemented)
                },
                child: const Text("Read More", style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
