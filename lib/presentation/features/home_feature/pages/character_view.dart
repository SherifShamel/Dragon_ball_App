import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../domain/entities/home_data.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({
    super.key,
  });

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HomeData;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: Constants.mediaQuery.height * 0.4,
              child: Image.network(args.imageUrl),
            ),
            Text(
              "Name: ${args.name}",
            ),
            Text(
              "Race: ${args.race}",
            ),
            Text(
              "Gender: ${args.gender}",
            ),
          ],
        ),
      ),
    );
  }
}

/*
Scaffold(
        body: BlocBuilder<HomeViewModel, HomeStates>(
      bloc: vm,
      builder: (context, state) {
        switch (state) {
          case LoadingHomeState():
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorHomeState():
            {
              return const Center(
                child: Text("Error"),
              );
            }
          case SuccessHomeState():
            {
              var data = state.dataList ?? [];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FlutterCarousel(
                    options: CarouselOptions(
                      height: Constants.mediaQuery.height * 0.3,
                      slideIndicator: const CircularSlideIndicator(),
                    ),
                    items: const [],
                  ),
                  Text(
                    "Name: ${widget.homeDataModel.name}",
                  ),
                ],
              );
            }
        }
      },
    ));*/
