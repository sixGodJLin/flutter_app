import 'package:flutter/material.dart';

class CustomScrollViewTestRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(

              title: const Text('Demo'),
              background: Image.asset("./images/lakes.png", fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
