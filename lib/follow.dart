import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nh_test_project/HexColor/HexColor.dart';

class Follow extends StatelessWidget {
  final int index;
  const Follow({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> users = List.generate(10, (i) => 'user $i');
    TabController tabController;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: HexColor('#ffffff'),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 35, bottom: 7),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          // margin: EdgeInsets.only(left: 19, top: 33),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context, true);
                            },
                            child: Image(
                                height: 32,
                                width: 32,
                                image: AssetImage(
                                    'assets/small_back_btn_orange.png'),
                                fit: BoxFit.contain),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          //  margin: EdgeInsets.only(top: 37),
                          child: Center(
                            child: Text(
                              'NickName',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'NanumSquareOTFB',
                                  color: HexColor('#000000')),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                initialIndex: index,
                length: 2,
                child: Column(
                  children: [
                    Material(
                      color: Colors.white,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey[400],
                            indicatorWeight: 1,
                            indicatorColor: Colors.black,
                            onTap: (index) {
                              print('index : $index');
                            },
                            tabs: [
                              Tab(
                                icon: Text('팔로워'),
                              ),
                              Tab(
                                icon: Text('팔로잉'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView.separated(
                            itemBuilder: (context, index) {
                              return _item(index);
                            },
                            itemCount: 5,
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1,
                                color: Colors.grey[300],
                              );
                            },
                          ),
                          ListView.separated(
                            itemBuilder: (context, index) {
                              return _item(index);
                            },
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1,
                                color: Colors.grey[300],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _item(int index) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage:
            CachedNetworkImageProvider('https://picsum.photos/id/$index/50/50'),
      ),
      title: Text('user $index'),
      subtitle: Text('Follow&Unfollow page 작업중~~'),
      trailing: Container(
        height: 30,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red[50],
          border: Border.all(color: Colors.black87, width: 0.5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'following',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red[700],
          ),
        ),
      ),
    );
  }
}
