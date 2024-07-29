import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_layout_switch/presentation/features/home_feature/pages/search_page.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/cubit.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/states.dart';
import 'package:test_layout_switch/presentation/features/home_feature/widgets/home_widget.dart';

import '../../../../generated/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

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
          title: const Text("Dragon Ball App"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchPage(),
                );
              },
            )
          ],
        ),
        body: BlocBuilder<HomeViewModel, HomeStates>(
          bloc: vm,
          builder: (BuildContext context, state) {
            switch (state) {
              case LoadingHomeState():
                {
                  return Center(child: Image.asset(Assets.imgLoading));
                }
              case ErrorHomeState():
                {
                  return Center(child: Text(state.errorMsg));
                }
              case SuccessHomeState():
                {
                  var homeData = state.dataList;

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
                }
            }
          },
        ),
      ),
    );
  }
}
