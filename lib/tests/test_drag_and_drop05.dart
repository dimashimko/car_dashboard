import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DragDropWithLocalPosition(),
    );
  }
}

class DragDropWithLocalPosition extends StatefulWidget {
  const DragDropWithLocalPosition({super.key});

  @override
  DragDropWithLocalPositionState createState() =>
      DragDropWithLocalPositionState();
}

class DragDropWithLocalPositionState extends State<DragDropWithLocalPosition> {
  Offset dropPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Drag & Drop with Local Position",
        ),
      ),
      body: Column(
        children: [
          Container(
            // width: double.infinity,
            width: 100,
            height: 100,
            color: Colors.orange,
          ),
          SizedBox(
            width: 500,
            height: 700,
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return DragTarget<String>(
                      builder: (context, candidateData, rejectedData) {
                        // return SizedBox();
                        // return Container();
                        return Container(
                          color: Colors.grey[300],
                          child: Stack(
                            children: [
                              Positioned(
                                left: dropPosition.dx,
                                top: dropPosition.dy,
                                child: const Text(
                                  "Dropped here!",
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      onWillAcceptWithDetails: (data) => true,
                      onAcceptWithDetails: (details) {
                        RenderBox renderBox =
                            context.findRenderObject() as RenderBox;
                        Offset localPosition =
                            renderBox.globalToLocal(details.offset);
                        setState(
                          () {
                            dropPosition = localPosition;
                          },
                        );
                        log('*** details.offset: ${details.offset}');
                        log('*** localPosition: $localPosition');
                        log('*** details.offset: ${details.data}');
                      },
                    );
                  },
                ),
                Positioned(
                  left: 50,
                  top: 50,
                  child: LongPressDraggable<String>(
                    data: "My Data",
                    feedback: const Material(
                      // color: Colors.transparent,
                      color: Colors.red,
                      child: Text('data'),
/*                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),*/
                    ),
                    childWhenDragging: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
