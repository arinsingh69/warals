import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login2_screen.dart';

class Login1Screen extends StatefulWidget {
  @override
  _Login1ScreenState createState() => _Login1ScreenState();
}

class _Login1ScreenState extends State<Login1Screen> {
  TextEditingController accountController = TextEditingController();
  bool isLoading = false;

  Future<void> submitAccount() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://arizshad-002-site5.ktempurl.com/api/Default'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"accountName": accountController.text}),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login2Screen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify account. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: accountController,
                    decoration: InputDecoration(
                      labelText: "Enter your account name",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isLoading ? null : submitAccount,
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text("Next"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
