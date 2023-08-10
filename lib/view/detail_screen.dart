import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api/save.dart';
import '../model/photos.dart';

class DetailScreen extends StatefulWidget {
  final String photos;

  const DetailScreen({Key? key, required this.photos}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('0xFF$hexCode'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'Wallpaper',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: widget.photos,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async =>
                    await saveNetworkImageToDownloads(widget.photos),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  "Download",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  var file =
                      await DefaultCacheManager().getSingleFile(widget.photos);
                  await WallpaperManager.setWallpaperFromFile(
                      file.path, WallpaperManager.HOME_SCREEN);
                  Fluttertoast.showToast(
                    msg: 'Set Wallpaper Success',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey[600],
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  "Set",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
