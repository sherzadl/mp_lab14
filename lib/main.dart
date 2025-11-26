import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MP Lab 14',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ResponsiveHome(),
    );
  }
}

/// A responsive wrapper to make your UI look good on:
/// - small phones
/// - large phones
/// - tablets portrait
/// - tablets landscape
class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // tablet if width >= 600
        final bool isTablet = width >= 600;

        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    // On tablets, keep UI from stretching too wide
                    maxWidth: isTablet ? 500 : double.infinity,
                  ),
                  child: const LoginScreen(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
