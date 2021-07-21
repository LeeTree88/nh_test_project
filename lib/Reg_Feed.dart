import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class Reg_Feed extends StatefulWidget {
  const Reg_Feed({Key? key}) : super(key: key);

  @override
  _Reg_FeedState createState() => _Reg_FeedState();
}

class _Reg_FeedState extends State<Reg_Feed> {
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        images.length,
        (index) {
          Asset asset = images[index];
          print('asset = $asset');
          return AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          );
        },
      ),
    );
  }

  Widget _selected_img(double height) {
    return Stack(
      children: [
        ImageSlideshow(
          width: double.infinity,

          /// Height of the [ImageSlideshow].
          height: height * 0.4,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: Colors.blue,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.grey,

          children: [
            GridView.count(
              crossAxisCount: 1,
              children: List.generate(
                images.length,
                (index) {
                  Asset asset = images[index];
                  print('asset = $asset');
                  return AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  );
                },
              ),
            )
          ],
          onPageChanged: (value) {
            print('Page changed: $value');
          },
          // autoPlayInterval: 3000,
        ),
      ],
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          backgroundColor: '#0a0a0a',
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: true,
          selectCircleStrokeColor: "#ffffff",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LOGO'),
              // Image.asset(
              //   'assets/logo.png',
              //   fit: BoxFit.contain,
              //   height: 32,
              // ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              images.length == 0
                  ? GestureDetector(
                      onTap: () => loadAssets(),
                      child: Container(
                        height: height * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Icon(Icons.add_a_photo),
                      ) // Expanded(child: buildGridView()),
                      )
                  : Expanded(
                      child: _selected_img(height),
                    )
              // Expanded(
              //   child: buildGridView(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
