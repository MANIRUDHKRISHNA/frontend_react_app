import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  final List<TipCategory> tipCategories = [
    TipCategory(
      title: "packages",
      tips: [
        TipItem(
          title: "Best packages for tropical destinations",
          content:
          "For tropical destinations, Global Tours & Travels offers experiences where crops like sugarcane, bananas, coffee, rice, and coconuts thrive amidst lush landscapes. These areas are known for their high humidity, consistent rainfall, and warm temperatures, providing an ideal escape into nature’s bounty. With Global Tours & Travels, you can explore these vibrant tropical regions, soaking in the rich culture, unique agricultural landscapes, and sustainable travel options that respect and celebrate the local environment.",
        ),
        TipItem(
          title: "Price Range",
          content:
          '''
                 Tropical Delights Tour Highlights:

 * Bananas
      Price Range: ₹20 - ₹40 per kg
      Explore local markets and banana plantations, where you can savor fresh, sun-ripened bananas and learn about the local cultivation practices in tropical climates.

 * Coffee
      Price Range: ₹500 - ₹800 per kg
      Visit coffee farms nestled in lush, high-altitude regions. Discover the coffee-making process from bean to cup and experience the unique flavors of locally produced coffee. Perfect for coffee lovers!

 * Rice
      Price Range: ₹25 - ₹50 per kg
      Wander through rice paddies in scenic landscapes. Experience how rice is grown and harvested in tropical climates and enjoy traditional meals made from locally-sourced rice.

 * Coconuts
      Price Range: ₹15 - ₹25 per piece
      Stroll through coconut groves and witness how locals harvest and use coconuts. Enjoy fresh coconut water and try products made from coconuts, a tropical staple!

            ''',
        ),
        TipItem(
          title: "Tips",
          content:
          '''
          Eco-Farming Experience Highlights:

Rice Fields
Experience the art of rice cultivation with a guided tour through lush paddies, where farmers practice careful irrigation techniques to ensure healthy crops. Learn about sustainable water management and traditional planting methods that make rice a staple in tropical regions.

Banana Plantations
Walk through vibrant banana plantations and see how strategic plant spacing and regular pruning contribute to healthy, high-yield crops. Visitors can learn hands-on techniques and sustainable practices used by local farmers to maintain productivity.

Coconut Groves
Discover the essentials of growing coconuts in tropical climates. In coconut groves, observe how deep, well-drained soil plays a vital role in coconut growth. See sustainable harvesting practices and sample fresh coconut products straight from the source.
          ''',
        ),
      ],
    ),
    TipCategory(
      title: "Temperate Climate",
      tips: [
        TipItem(
          title: "Best climate choices",
          content:
          "Discover temperate crops that flourish in regions with moderate rainfall and cooler, well-defined seasons. These climates are perfect for exploring lush fields of wheat, corn, soybeans, and barley, offering a unique glimpse into the local agricultural life.",
        ),
        TipItem(
          title: "most popular experiences",
          content:
          '''
Farm-to-Table Delights:

Wheat: ₹15 - ₹30 per kg – Enjoy visiting wheat fields and try locally-made bread and other wheat products.
Corn: ₹12 - ₹25 per kg – Witness the golden cornfields and taste fresh, local corn delicacies.
Soybeans: ₹40 - ₹60 per kg – Learn about soybean cultivation and savor dishes made from this nutritious crop.
Barley: ₹25 - ₹40 per kg – Discover the role of barley in local brewing and traditional foods.
          ''',
        ),
        TipItem(
          title: "Traveler Tips",
          content:
          '''
Seasonal Planting and Sustainability:
Experience seasonal planting of wheat and barley, often sown in the cooler months for optimum growth. Learn about sustainable practices like crop rotation to maintain soil health, and see how farmers use nitrogen-rich fertilizers to boost yield and reduce pest impact.
          ''',
        ),
      ],
    ),
    TipCategory(
      title: "history & heritage",
      tips: [
        TipItem(
          title: "Discover",
          content:
          '''
          Discover History & Heritage with Global Tours & Travels

Ancient Civilizations and Archeological Sites
Step back in time to witness the grandeur of ancient civilizations. From the monumental pyramids of Egypt and the architectural marvels of Greece to the mystical temples of Southeast Asia, these sites offer a glimpse into the lives, beliefs, and artistry of bygone eras. With Global Tours & Travels, experience guided tours that bring history alive, delving into stories that shaped the world as we know it.

Heritage Cities and Cultural Landmarks
Travel through cities where history is woven into every street and building. Explore medieval castles in Europe, ancient fortresses in Asia, and historic quarters where cultural traditions are still upheld today. Our tours take you to UNESCO World Heritage Sites, allowing you to experience firsthand the beauty and significance of these remarkable places.

Local Traditions and Folklore
Dive deep into the unique customs, music, and folklore that define each destination. From the enchanting dance forms of South America and Asia to the vibrant festivals of India and Africa, immerse yourself in the local ways of life. Witness traditional artisans at work, creating crafts passed down through generations, and gain insights into the spiritual practices that are at the heart of many cultures.

Colonial Heritage and Architectural Wonders
Uncover the complex history of colonial periods, exploring both the legacy and impact left behind in the architecture, cuisine, and blended cultures of many regions. Stroll through cobbled streets lined with colonial-era buildings, visit grand palaces, and hear the fascinating stories of how local and foreign cultures intermingled to shape today’s heritage.

Indigenous Heritage and Sacred Sites
For those with a spirit of adventure and respect for cultural diversity, explore indigenous communities and sacred natural sites. These journeys allow travelers to connect with traditions rooted deeply in the land, learning about sustainable practices, age-old wisdom, and spiritual connections to nature that have been preserved for centuries.
          ''',
        ),

      ],
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"), // Background image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.orange.withOpacity(0.1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: tipCategories.length,
            itemBuilder: (context, index) {
              return TipCategoryWidget(category: tipCategories[index]);
            },
          ),
        ),
      ),
    );
  }
}

class TipCategory {
  final String title;
  final List<TipItem> tips;

  TipCategory({required this.title, required this.tips});
}

class TipItem {
  final String title;
  final String content;

  TipItem({required this.title, required this.content});
}

class TipCategoryWidget extends StatelessWidget {
  final TipCategory category;

  TipCategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ExpansionTile(
        title: Text(
          category.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: category.tips.map((tip) {
          return ListTile(
            title: Text(
              tip.title,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(tip.content),
          );
        }).toList(),
      ),
    );
  }
}