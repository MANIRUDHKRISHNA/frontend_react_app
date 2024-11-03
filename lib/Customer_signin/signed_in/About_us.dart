import 'package:flutter/material.dart';

void main() {
  runApp(CompanyPageApp());
}

class CompanyPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CompanyPage(),
    );
  }
}

class CompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Global Tours & Travels',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange.shade800,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/company_background.jpg"), // Add your background image here
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.orange.withOpacity(0.1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionHeader('Company Overview'),
              _sectionTitle('Introduction to Global Tours and Travels'),
              _sectionText(
                'Global Tours and Travels is a customer-centric travel agency created by a group of college students from VIT-AP, focused on providing affordable and comprehensive trip packages. '
                    'We believe in curating seamless travel experiences, offering services that include accommodation, transportation, and guided tours, all crafted to meet the needs of middle-class customers.',
              ),
              _sectionHeader('About the Company'),
              _sectionText(
                'We aim to enrich lives through affordable travel and to promote sustainable tourism that leaves a positive impact on the environment. With a focus on transparency and customer satisfaction, '
                    'we are committed to building strong relationships with our clients and ensuring they have memorable journeys with us.',
              ),
              _sectionHeader('Mission Statement'),
              _sectionText(
                'To deliver exceptional and accessible travel experiences that enrich our customers’ lives while fostering a culture of exploration and adventure.',
              ),
              _sectionHeader('Vision Statement'),
              _sectionText(
                'To be the leading travel agency recognized worldwide for our commitment to customer satisfaction, innovative travel solutions, and sustainable tourism practices.',
              ),
              _sectionHeader('Core Values'),
              _bulletList([
                'Customer Commitment: Prioritizing the needs and preferences of our clients to ensure memorable travel experiences.',
                'Integrity: Upholding honesty and transparency in all our dealings.',
                'Innovation: Continuously seeking new and creative ways to enhance travel services and experiences.',
                'Sustainability: Promoting eco-friendly travel options and minimizing our environmental impact.',
                'Collaboration: Building strong partnerships with local businesses and communities to enrich our offerings.',
              ]),
              _sectionHeader('Our Team'),
              _sectionText(
                'Our dedicated team of travel experts is committed to continuous training and development, bringing extensive expertise and enthusiasm to our clients. As students, we are passionate about combining '
                    'learning with real-world applications, ensuring the best possible experience for those who travel with us.',
              ),
              _sectionHeader('Contact Information'),
              _sectionText(
                'Address: VIT-AP University\n'
                    'Phone: +91 1234567890\n'
                    'Email: info@globaltoursandtravels.com\n'
                    'Follow us on social media for updates and promotions!',
              ),
              _sectionHeader('Testimonials and Reviews'),
              _sectionText(
                '“Global Tours and Travels made our trip unforgettable! Great service and affordable packages.” - Customer Review\n'
                    '“Highly recommended for budget-friendly and well-organized tours.” - Customer Review',
              ),
              _sectionHeader('Frequently Asked Questions (FAQs)'),
              _bulletList([
                'How do I book a trip? - Visit our website or contact us directly.',
                'What is included in the packages? - Each package includes accommodation, transport, and guided tours. Optional add-ons are available.',
                'Are there discounts for group bookings? - Yes, we offer discounts for groups.',
              ]),
              _sectionHeader('Call to Action'),
              _sectionText(
                'Ready to explore the world? Contact us today or visit our website to book your next adventure with Global Tours & Travels!',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange.shade900),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.orange.shade700),
      ),
    );
  }

  Widget _sectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  Widget _bulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("• ", style: TextStyle(fontSize: 16, color: Colors.black87)),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
