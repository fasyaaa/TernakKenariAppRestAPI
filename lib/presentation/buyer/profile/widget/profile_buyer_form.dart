import 'package:flutter/material.dart';

class ProfileBuyerForm extends StatefulWidget {
  const ProfileBuyerForm({super.key});

  @override
  State<ProfileBuyerForm> createState() => _ProfileBuyerFormState();
}

class _ProfileBuyerFormState extends State<ProfileBuyerForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children: [],
        ),
      ),
    );
  }
}