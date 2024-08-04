import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_layout_switch/generated/assets.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/view_model/cubit.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/widgets/transformations_widget.dart';
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
    var args = ModalRoute
        .of(context)!
        .settings
        .arguments as HomeData;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.white60,
            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: true,
              title: Text(args.name),
              background: Hero(
                tag: args.id,
                child: Image.network(
                  args.imageUrl,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    "Race: ${args.race}",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    "Gender: ${args.gender}",
                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: BlocBuilder<CharacterViewModel, CharacterStates>(
                    bloc: vm..getData(args.id.toString()),
                    builder: (context, state) {
                      switch (state) {
                        case CharacterLoadingState():
                          {
                            return Center(
                                child: Image.asset(Assets.imgLoading));
                          }
                        case CharacterErrorState():
                          {
                            return const Center(child: Text("Error"));
                          }
                        case CharacterSuccessState():
                          {
                            var data = state.transformationData;
                            return data.isNotEmpty
                                ? ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (buildContext, index) =>
                                  TransformationsWidget(
                                    transformationData: data[index],
                                  ),
                            )
                                : Center(
                              child: Text(
                                  "No Transformation for ${args.name}"),
                            );
                          }
                      }
                    },
                  ),
                ),
                // SizedBox(height: 20,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
            color: Colors.grey,
              height: Constants.mediaQuery.height * 0.3,
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
            BlocBuilder<CharacterViewModel, CharacterStates>(
              bloc: vm..getData(args.id.toString()),
              builder: (context, state) {
                switch (state) {
                  case CharacterLoadingState():
                    {
                      return Center(child: Image.asset(Assets.imgLoading));
                    }
                  case CharacterErrorState():
                    {
                      return const Center(child: Text("Error"));
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
                                  transformationData: data[index],
                                ),
                              ),
                            )
                          : Center(
                              child: Text("No Transformation for ${args.name}"),
                            );
                    }
                }
              },
            )
          ],
        ),
      ),*/
