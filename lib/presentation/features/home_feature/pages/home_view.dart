import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/cubit.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/states.dart';
import 'package:test_layout_switch/presentation/features/home_feature/widgets/home_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var vm = HomeViewModel();

  @override
  void initState() {
    vm.getData("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   // title: Text(
        //   //   selectedCharacter == null
        //   //       ? "Dragon Ball App"
        //   //       : selectedCharacter!.name,
        //   // ),
        // ),
        // drawer: CustomDrawer(onCharacterDrawerTap: onCharacterDrawerTab),
        body: BlocBuilder<HomeViewModel, HomeStates>(
          bloc: vm,
          builder: (BuildContext context, state) {
            switch (state) {
              case LoadingHomeState():
                {
                  return const Center(
                      child: CircularProgressIndicator());
                }
              case ErrorHomeState():
                {
                  return Center(child: Text(state.errorMsg));
                }
              case SuccessHomeState():
                {
                  var homeData = state.dataList ?? [];

                  return GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return HomeWidget(
                        homeData: homeData[index],
                      );
                    },
                    itemCount: homeData.length,
                  );
                  /*return Expanded(
                        child: ListView.builder(
                          itemCount: homeData.length,
                          itemBuilder: (context, index) {
                            return HomeWidget(homeData: homeData[index]);
                          },
                        ),
                      );*/
                }
            }
          },
        ),
      ),
    );
  }
}
