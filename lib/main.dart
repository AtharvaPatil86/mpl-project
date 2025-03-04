import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myproject/home_page.dart';
import 'package:myproject/members_list.dart';
import 'package:myproject/personal_trainers.dart';
import 'package:myproject/new_membership.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner
      home: GymHomePage(),
    );
  }
}

class GymHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AIM FITNESS GYM"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        leading: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "members") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MembersListScreen()));
            } else if (value == "trainers") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalTrainersScreen()));
            } else if (value == "membership") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GetMembershipScreen()));
            } else if (value == "collection") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionDataScreen()));
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(value: "members", child: Text("Members List")),
              PopupMenuItem(value: "trainers", child: Text("Personal Trainers")),
              PopupMenuItem(value: "membership", child: Text("Get Membership")),
              PopupMenuItem(value: "collection", child: Text("Collection Data")),
            ];
          },
          icon: Icon(Icons.menu),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Images/Hanuman.PNG"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CollectionDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Collection Data")),
      body: Center(child: Text("Membership Collection Data will be displayed here")),
    );
  }
}
