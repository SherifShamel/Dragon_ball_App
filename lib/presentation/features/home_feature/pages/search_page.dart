import 'package:flutter/material.dart';
import 'package:test_layout_switch/generated/assets.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/cubit.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/config/page_route_names.dart';
import '../../../../domain/entities/home_data.dart';
import '../../../../main.dart';

class SearchPage extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.close),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: HomeViewModel.search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Image.asset(Assets.imgLoading),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        }
        if (snapshot.hasData) {
          var data = snapshot.data;
          return Center(
            child: _searchCharacterWidget(data!),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }

  Widget _searchCharacterWidget(List<HomeData> homeDataList) {
    return GridView.builder(
      itemCount: homeDataList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          navigatorKey.currentState?.pushNamed(PageRouteName.character,
              arguments: homeDataList[index]);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                height: Constants.mediaQuery.height * 0.3,
                width: Constants.mediaQuery.width * 0.5,
                child: Image.network(
                  homeDataList[index].imageUrl,
                  opacity: const AlwaysStoppedAnimation(0.4),
                ),
              ),
            ),
            Text(
              homeDataList[index].name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
