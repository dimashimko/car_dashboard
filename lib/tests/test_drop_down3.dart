import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(DraggableRectanglesApp());
}

class DraggableRectanglesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable Rectangles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DraggableRectanglesPage(),
    );
  }
}

class DraggableRectanglesPage extends StatefulWidget {
  @override
  _DraggableRectanglesPageState createState() =>
      _DraggableRectanglesPageState();
}

class _DraggableRectanglesPageState extends State<DraggableRectanglesPage> {
  // List to store rectangle positions
  List<Offset> rectanglePositions = [];

  // Generate a unique color for each rectangle
  Color _generateUniqueColor(int index) {
    return Colors.primaries[index % Colors.primaries.length].shade300;
  }

  @override
  void initState() {
    super.initState();
    // Initialize with a few rectangles
    rectanglePositions = [
      Offset(100, 100),
      Offset(200, 200),
      Offset(300, 300),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Draggable Rectangles'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.add),
      //       onPressed: () {
      //         setState(() {
      //           // Add a new rectangle at a default position
      //           rectanglePositions.add(Offset(50, 50));
      //         });
      //       },
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.orange,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                log('*** maxWidth:  ${constraints.maxWidth}');
                log('*** maxHeight: ${constraints.maxHeight}');
                return Stack(
                  children: [
                    // Draggable surface
                    Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      color: Colors.grey[200],
                      child: CustomPaint(
                        painter: GridPainter(),
                      ),
                    ),
                    // Draggable rectangles
                    ...List.generate(
                      rectanglePositions.length,
                      (index) {
                        return Positioned(
                          left: rectanglePositions[index].dx,
                          top: rectanglePositions[index].dy,
                          child: Draggable(
                            feedback: _buildRectangle(index, true),
                            childWhenDragging:
                                Container(), // Empty when dragging
                            onDragEnd: (details) {
                              setState(
                                () {
                                  RenderBox renderBox =
                                      context.findRenderObject() as RenderBox;
                                  Offset localPosition =
                                      renderBox.globalToLocal(details.offset);
                                  rectanglePositions[index] = localPosition;

                                  log('*** localPosition: ${localPosition}');
                                },
                              );
                            },
                            child: _buildRectangle(index, false),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Build rectangle widget
  Widget _buildRectangle(int index, bool isDragging) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: _generateUniqueColor(index).withOpacity(isDragging ? 0.5 : 1),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Rect ${index + 1}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Custom painter to create a grid background
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += 50) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += 50) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
