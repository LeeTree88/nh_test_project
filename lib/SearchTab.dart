import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var _searchData = '';
  final _formKey = GlobalKey<FormState>();

  SizedBox _searchInput() {
    print('formkey $_formKey');
    return SizedBox(
      height: 40,
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(left: 10, bottom: 10),
          child: TextFormField(
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              labelText: _searchData.length > 0 ? '' : '검색',
            ),
            onFieldSubmitted: (data) {
              setState(() {
                _searchData = data;
              });
            },
          ),
        ),
      ),
    );
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    print("_onRefresh start");

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print("_onLoading start");

    _refreshController.loadComplete();
  }

  Expanded _scrollImage() {
    return Expanded(
        child: Scrollbar(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus status) {
            Widget body;
            if (status == LoadStatus.idle) {
              body = Text("");
            } else if (status == LoadStatus.loading) {
              //  body = CupertinoActivityIndicator();
              body = Container(
                padding: EdgeInsets.only(top: 10),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              );
            } else if (status == LoadStatus.failed) {
              body = Text("");
            } else if (status == LoadStatus.canLoading) {
              body = Text("");
            } else {
              body = Text("");
            }
            return Container(
              //  height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          crossAxisSpacing: 3.3,
          mainAxisSpacing: 3.3,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            child: Container(
              constraints: BoxConstraints.expand(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: _gridImgItem(index),
              ),
            ),
            onTap: () {
              print("index on tap : $index");
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) =>
              //         profile_detail(user_key: items_key[index]),
              //   ),
              // );
            },
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.count(
              index % 6 == 1 ? 2 : 1, index % 6 == 1 ? 2 : 1),
        ),
      ),
    ));
  }

  CachedNetworkImage _gridImgItem(int index) {
    return CachedNetworkImage(
      imageUrl: "https://picsum.photos/id/$index/100/100",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        height: 50,
        width: 50,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _searchInput(),
          _scrollImage(),
        ],
      ),
    );
  }
}
