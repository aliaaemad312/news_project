import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.home,
        style: TextStyle(
          color: Colors.white
        ),),
      ),

    );
  }
}
