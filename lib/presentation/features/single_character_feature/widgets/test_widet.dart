import 'package:flutter/material.dart';
import 'package:test_layout_switch/domain/entities/transformation_data.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/view_model/cubit.dart';


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
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

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
