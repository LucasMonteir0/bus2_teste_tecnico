import 'package:flutter/material.dart';

class DetailsViewParams {}

class DetailsView extends StatelessWidget {
  final DetailsViewParams params;

  const DetailsView({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Details View')));
  }
}
