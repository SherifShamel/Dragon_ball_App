import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';

class CustomDrawer extends StatelessWidget {
  final Function onCharacterDrawerTap;

  const CustomDrawer({super.key, required this.onCharacterDrawerTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            // width: Constants.mediaQuery.width * 0.8, (useless code)
            alignment: Alignment.center,
            height: 160,
            color: Colors.green,
            child: const Text(
              "News App!",
            ),
          ),
          InkWell(
            onTap: () {
              onCharacterDrawerTap();
            },
            child: const Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 25,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.list_outlined,
                    size: 35,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "Characters",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
