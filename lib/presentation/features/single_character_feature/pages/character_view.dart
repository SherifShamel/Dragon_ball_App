import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_layout_switch/domain/entities/home_data.dart';
import 'package:test_layout_switch/presentation/features/home_feature/pages/home_view.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/cubit.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/states.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/widgets/character_card_widget.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({
    super.key,
  });

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  var vm = HomeViewModel();

  @override
  void initState() {
    vm.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Character View"),
          ),
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
                    return CharacterCardWidget(homeData: data[0]);
                  }
              }
            },
          )),
    );
  }
}
