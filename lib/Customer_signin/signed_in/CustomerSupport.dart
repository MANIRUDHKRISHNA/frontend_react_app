import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  // Predefined questions
  final List<String> _predefinedQuestions = [
    'Hello',
    'What is your name',
    'How do I track my order on package',
    'What is your refund policy',
    'How do I trust if GTT is safe?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Care'),
      ),
      body: Column(
        children: [
          // Buttons for predefined questions
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _predefinedQuestions.map((question) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      _messageController.text = question;
                    },
                    child: Text(question, textAlign: TextAlign.center),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatMessageWidget(_messages[index]);
              },
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  child: Text('Send'),
                  onPressed: () {
                    _handleMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: message, isUser: true));
      });
      _messageController.clear();
      _respondToMessage(message);
    }
  }

  void _respondToMessage(String message) {
    final response = _getResponse(message);
    if (response != null) {
      setState(() {
        _messages.add(ChatMessage(text: response, isUser: false));
      });
    }
  }

  String? _getResponse(String message) {
    switch (message.toLowerCase()) {
      case 'hello':
      case 'hi':
        return 'Hello! How can I assist you today?';
      case 'what is your name':
        return 'My name is Chatbot, and I\'m here to help you with any questions or concerns you may have.';
      case 'how do i track my order on package':
        return 'You can track your order by logging into your account and clicking on the "Order History" tab.';
      case 'what is your refund policy':
        return 'Our refund policy allows you to refund your amount within 7 days to your respective payment id. Please see our website for more details.';
      case 'how do i trust if gtt is safe?':
        return 'We value transparency and the experiences of our travelers. You can find genuine reviews and testimonials from satisfied customers who have enjoyed seamless, memorable journeys with GTT. We are proud to showcase their stories.';

    }
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  ChatMessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: message.isUser
          ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : EdgeInsets.only(top: 8, bottom: 8, right: 80),
      decoration: BoxDecoration(
        color: message.isUser ? Colors.blue[200] : Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(message.text),
    );
  }
}
