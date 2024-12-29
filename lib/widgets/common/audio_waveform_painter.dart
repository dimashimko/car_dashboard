import 'dart:math';

import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:just_waveform/just_waveform.dart';

class AudioWaveformPainter extends CustomPainter {
  final double scale;
  final double strokeWidth;
  final double pixelsPerStep;
  final Paint wavePaint;
  final Paint wavePaintGray;
  final Waveform waveform;
  final Duration start;
  final Duration duration;
  final int currentPosition;

  AudioWaveformPainter({
    required this.waveform,
    required this.start,
    required this.duration,
    required this.currentPosition,
    Color waveColor = Colors.blue,
    this.scale = 1.0,
    this.strokeWidth = 5.0,
    this.pixelsPerStep = 8.0,
  })  : wavePaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..color = waveColor,
        wavePaintGray = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..color = AppColors.grayAudio;

  @override
  void paint(Canvas canvas, Size size) {
    if (duration == Duration.zero) return;

    double width = size.width;
    double height = size.height;

    // Calculate the progress position on the canvas
    double progressInPercent = (currentPosition / duration.inMilliseconds);
    double progressX = width * progressInPercent;

    final int waveformPixelsPerWindow =
        waveform.positionToPixel(duration).toInt();
    final double waveformPixelsPerDevicePixel = waveformPixelsPerWindow / width;
    final double waveformPixelsPerStep =
        waveformPixelsPerDevicePixel * pixelsPerStep;
    final double sampleOffset = waveform.positionToPixel(start);
    final double sampleStart = -sampleOffset % waveformPixelsPerStep;

    for (double i = sampleStart;
        i <= waveformPixelsPerWindow + 1.0;
        i += waveformPixelsPerStep) {
      final sampleIdx = (sampleOffset + i).toInt();
      final x = i / waveformPixelsPerDevicePixel;
      final minY = normalise(waveform.getPixelMin(sampleIdx), height);
      final maxY = normalise(waveform.getPixelMax(sampleIdx), height);

      final paint = (x <= progressX) ? wavePaint : wavePaintGray;
      canvas.drawLine(
        Offset(x + strokeWidth / 2, max(strokeWidth * 0.75, minY)),
        Offset(x + strokeWidth / 2, min(height - strokeWidth * 0.75, maxY)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant AudioWaveformPainter oldDelegate) => true;

  double normalise(int s, double height) {
    if (waveform.flags == 0) {
      final y = 32768 + (scale * s).clamp(-32768.0, 32767.0).toDouble();
      return height - 1 - y * height / 65536;
    } else {
      final y = 128 + (scale * s).clamp(-128.0, 127.0).toDouble();
      return height - 1 - y * height / 256;
    }
  }
}
