import 'package:flutter/material.dart';
import 'package:test_layout_switch/domain/entities/transformation_data.dart';


class TransformationsWidget extends StatefulWidget {
  final TransformationData transformationData;

  const TransformationsWidget({
    super.key,
    required this.transformationData,
  });

  @override
  State<TransformationsWidget> createState() => _TransformationsWidgetState();
}

class _TransformationsWidgetState extends State<TransformationsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.network(
        widget.transformationData.image,
      ),
    );
  }
}
