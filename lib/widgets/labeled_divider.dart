import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class RenderLabeledDivider extends RenderBox {
  String _label;
  double _thickness;
  Color _color;

  set label(String value) {
    if (_label != value) {
      _label = value;
    }
    markNeedsSemanticsUpdate();
  }

  set thickness(double value) {
    if (_thickness != value) {
      _thickness = value;
    }
    markNeedsLayout();
  }

  set color(Color value) {
    if (_color != value) {
      _color = value;
    }
    markNeedsPaint();
  }

  String get label => _label;
  double get thickness => _thickness;
  Color get color => _color;

  late TextPainter _textPainter;

  @override
  void performLayout() {
    _textPainter.text = TextSpan(
      text: label,
      style: TextStyle(color: color),
    );
    _textPainter.layout();
    final double textHeight = _textPainter.size.height;
    size = constraints.constrain(
      Size(double.infinity, _thickness + textHeight),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()..color = _color;
    final double yCenter = offset.dy + size.height / 2;

    // line
    context.canvas.drawLine(
      offset,
      Offset(offset.dx + size.width, yCenter),
      paint,
    );

    // text
    final double textStart =
        offset.dx + (size.width - _textPainter.size.width) / 2;
    _textPainter.paint(
      context.canvas,
      Offset(textStart, yCenter - _textPainter.size.height / 2),
    );
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
    config
      ..isSemanticBoundary = true
      ..label = 'Divider with text: $_label';
  }

  RenderLabeledDivider({
    required String label,
    required double thickness,
    required Color color,
  }) : _label = label,
       _thickness = thickness,
       _color = color {
    _textPainter = TextPainter(textDirection: TextDirection.ltr);
  }
}

class LabeledDivider extends LeafRenderObjectWidget {
  const LabeledDivider({
    super.key,
    required this.label,
    this.thickness = 1.0,
    this.color = Colors.black,
  });

  final String label;
  final double thickness;
  final Color color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderLabeledDivider(
      label: label,
      thickness: thickness,
      color: color,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderLabeledDivider renderObject,
  ) {
    renderObject
      ..label = label
      ..thickness = thickness
      ..color = color;
  }
}
