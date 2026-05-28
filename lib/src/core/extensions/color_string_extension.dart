import 'package:flutter/material.dart';

extension ColorStringExtension on String {
  Color toColor() {
    final normalized = trim().toLowerCase();

    if (normalized.startsWith('#')) {
      return _fromHex(normalized);
    }

    if (normalized.startsWith('0x')) {
      return _fromHex('#${normalized.substring(2)}');
    }

    if (normalized.startsWith('rgb(') && normalized.endsWith(')')) {
      final values = _parseChannelList(normalized, 'rgb(');
      return Color.fromRGBO(
        values[0].toInt(),
        values[1].toInt(),
        values[2].toInt(),
        1,
      );
    }

    if (normalized.startsWith('rgba(') && normalized.endsWith(')')) {
      final values = _parseChannelList(normalized, 'rgba(');
      final alpha = double.parse(values[3].toString()).clamp(0, 1).toDouble();
      return Color.fromRGBO(
        values[0].toInt(),
        values[1].toInt(),
        values[2].toInt(),
        alpha,
      );
    }

    throw FormatException('Unsupported color format: $this');
  }

  Color _fromHex(String input) {
    final hex = input.replaceFirst('#', '');

    if (hex.length == 6) {
      return Color(int.parse('FF$hex', radix: 16));
    }

    if (hex.length == 8) {
      return Color(int.parse(hex.toUpperCase(), radix: 16));
    }

    throw FormatException('Invalid hex color: $input');
  }

  List<num> _parseChannelList(String input, String prefix) {
    final raw = input.substring(prefix.length, input.length - 1);
    final parts = raw.split(',').map((part) => part.trim()).toList();

    if (parts.length != (prefix == 'rgb(' ? 3 : 4)) {
      throw FormatException('Invalid color channel count: $input');
    }

    final numbers = <num>[];
    for (final part in parts) {
      numbers.add(num.parse(part));
    }

    return numbers;
  }
}
