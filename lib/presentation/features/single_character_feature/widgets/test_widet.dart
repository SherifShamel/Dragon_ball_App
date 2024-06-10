import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_layout_switch/domain/entities/transformation_data.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/cubit.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/view_model/cubit.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/view_model/states.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/widgets/transformations_widget.dart';

import '../../../../core/config/constants.dart';
import '../../../../domain/entities/home_data.dart';

class TestNewWidget extends StatefulWidget {
  final TransformationData transformationData;

  const TestNewWidget({
    required this.transformationData,
    super.key,
  });

  @override
  State<TestNewWidget> createState() => _TestNewWidgetState();
}

class _TestNewWidgetState extends State<TestNewWidget> {
  var vm = CharacterViewModel();

  @override
  void initState() {
    vm.getData(widget.transformationData.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HomeData;

    return Scaffold(
      body:Image.network(widget.transformationData.image,)
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
