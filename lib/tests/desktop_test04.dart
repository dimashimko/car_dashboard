import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ResponsiveCards(),
    ),
  );
}

class ResponsiveCards extends StatelessWidget {
  final double cardMaxWidth = 250; // Maximum width for each card
  final double spacing = 10;

  const ResponsiveCards({super.key}); // Spacing between cards

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Total available width for the Wrap
              double availableWidth = constraints.maxWidth;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(
                  10,
                  (index) {
                    return LayoutBuilder(
                      builder: (context, cardConstraints) {
                        // Calculate the width of each card, making sure it doesn't exceed the maximum
                        double cardWidth = (availableWidth / 3) - (2 * spacing);
                        cardWidth =
                            cardWidth > cardMaxWidth ? cardMaxWidth : cardWidth;

                        return Container(
                          width: cardWidth,
                          height: 150,
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(
                              'Card ${index + 1}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
