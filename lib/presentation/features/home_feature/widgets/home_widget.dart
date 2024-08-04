import 'package:flutter/material.dart';
import 'package:test_layout_switch/core/config/constants.dart';
import 'package:test_layout_switch/core/config/page_route_names.dart';
import 'package:test_layout_switch/domain/entities/home_data.dart';
import 'package:test_layout_switch/main.dart';

class HomeWidget extends StatefulWidget {
  final HomeData homeData;

  const HomeWidget({
    Key? key,
    required this.homeData,
  }) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorKey.currentState
            ?.pushNamed(PageRouteName.character, arguments: widget.homeData);
      },
      child: Hero(
        tag: widget.homeData.id,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                height: Constants.mediaQuery.height * 0.3,
                width: Constants.mediaQuery.width * 0.5,
                child: Image.network(
                  widget.homeData.imageUrl,
                  opacity: const AlwaysStoppedAnimation(0.4),
                ),
              ),
            ),
            Text(
              widget.homeData.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
