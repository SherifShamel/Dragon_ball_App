import 'package:flutter/material.dart';
import 'package:test_layout_switch/core/config/constants.dart';
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
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey,
      child: Column(
        children: [
          Image.network(
            widget.transformationData.image,
          ),
          Text(
            widget.transformationData.name,
            style: TextStyle(color: Constants.themeData.primaryColor),
          ),
          const Divider(
            color: Colors.black,
            height: 2,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
