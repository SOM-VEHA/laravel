import 'package:flutter/material.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            title: Text("Notifications",style: TextStyle(color: Colors.white),),
            leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
