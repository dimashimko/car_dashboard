import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({
    super.key,
    required this.options,
    required this.height,
    this.background,
    this.color,
    this.textStyleSelected,
    this.textStyleNoSelected,
  });

  final List<String> options;
  final double height;
  final Color? background;
  final Color? color;
  final TextStyle? textStyleSelected;
  final TextStyle? textStyleNoSelected;

  @override
  CustomToggleButtonState createState() => CustomToggleButtonState();
}

class CustomToggleButtonState extends State<CustomToggleButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double availableWidth = constraints.maxWidth;

      return Stack(
        children: [
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.background ?? Colors.transparent,
              borderRadius: BorderRadius.circular(
                widget.height,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.easeInOut,
            height: widget.height,
            width: availableWidth / widget.options.length,
            decoration: BoxDecoration(
              color: widget.color ?? Colors.blue,
              borderRadius: BorderRadius.circular(
                widget.height,
              ),
            ),
            margin: EdgeInsets.only(
              left: (availableWidth / widget.options.length) * selectedIndex,
            ),
          ),
          Row(
            children: List.generate(widget.options.length, (index) {
              String option = widget.options[index];
              return Expanded(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    height: widget.height,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    curve: Curves.easeInOut,
                    child: Center(
                      child: Text(
                        option,
                        style: selectedIndex == index
                            ? widget.textStyleSelected ??
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                )
                            : widget.textStyleNoSelected ??
                                const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      );
    });
  }
}
