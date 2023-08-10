import 'package:flutter/material.dart';

import '../api/fetch_api.dart';
import '../data/data.dart';
import '../model/category_model.dart';
import '../model/constants.dart';
import '../model/photos.dart';
import '../widgets/logo.dart';
import '../widgets/wallpaper_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<CategoryModel> categories = getCategories();
  late List<String> photosList;
  int page = 1;
  bool isLoading = false;
  final TextEditingController queryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    photosList = urlData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        // elevation: 0,
        centerTitle: true,
        title: logo(),
      ),
      body: Column(
        children: [
          // SearchBar(
          //   controller: queryController,
          // ),
          const SizedBox(height: 16),
          // SizedBox(
          //   height: 50,
          //   child: ListView.separated(
          //     physics: const BouncingScrollPhysics(),
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     itemCount: categories.length,
          //     separatorBuilder: (context, index) => const SizedBox(width: 8),
          //     itemBuilder: (context, index) {
          //       return CategoryTile(
          //         category: categories[index].category,
          //         imgUrl: categories[index].imgUrl,
          //       );
          //     },
          //   ),
          // ),
          // const SizedBox(height: 25),
          Expanded(
            child: wallpaperList(context, photosList: urlData),
          ),
        ],
      ),
    );
  }
}
