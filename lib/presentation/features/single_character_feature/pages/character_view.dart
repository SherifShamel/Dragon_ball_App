import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/view_model/cubit.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/widgets/transformations_widget.dart';
import '../../../../core/config/constants.dart';
import '../../../../domain/entities/home_data.dart';
import '../view_model/states.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({
    super.key,
  });

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  var vm = CharacterViewModel();

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
              "ID: ${args.id}",
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
            // FutureBuilder(
            //   future: vm.getData(args.id.toString()),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return const Text("Error");
            //     }
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const CircularProgressIndicator();
            //     }
            //     var data = snapshot.data as List;
            //     return Expanded(
            //       child: ListView.builder(
            //         itemCount: 3,
            //         itemBuilder: (buildContext, index) =>
            //             TransformationsWidget(transformationData: data?[index]),
            //       ),
            //     );
            //   },
            // )
            Expanded(
              child: BlocBuilder<CharacterViewModel, CharacterStates>(
                bloc: vm..getData(args.id.toString()),
                builder: (context, state) {
                  switch (state) {
                    case CharacterLoadingState():
                      {
                        return const CircularProgressIndicator();
                      }
                    case CharacterErrorState():
                      {
                        return const Text("Error");
                      }
                    case CharacterSuccessState():
                      {
                        var data = state.transformationData;
                        return data.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (buildContext, index) =>
                                        TransformationsWidget(
                                            transformationData: data[index])),
                              )
                            : Center(
                                child:
                                    Text("No Transformation for ${args.name}"));
                      }
                  }
                },
              ),
            )
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
