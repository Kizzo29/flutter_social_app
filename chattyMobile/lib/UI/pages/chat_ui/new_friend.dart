import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

class _AZItem extends ISuspensionBean {
  final String title;
  final String tag;

  _AZItem({required this.title, required this.tag});
  String getSuspensionTag() => tag;
}

class NewFriend extends StatefulWidget {
  final List<String> items;
  NewFriend({Key? key, required this.items}) : super(key: key);

  @override
  _NewFriendState createState() => _NewFriendState();
}

class _NewFriendState extends State<NewFriend> {
  List<_AZItem> items = [];
  @override
  void initState() {
    super.initState();
    initList(widget.items);
  }

  void initList(List<String> items) {
    this.items = items
        .map((item) => _AZItem(title: item, tag: item[0].toUpperCase()))
        .toList();
    SuspensionUtil.sortListBySuspensionTag(this.items);
    SuspensionUtil.setShowSuspensionStatus(this.items);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: TabBarView(children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  floating: true,
                  snap: true,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  centerTitle: true,
                  title: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 50, top: 5),
                      child: Container(
                        width: _size.width * 0.8,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.grey,
                            onChanged: (v) {},
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for People",
                                icon: Icon(Icons.search, color: Colors.grey),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 1))),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30)),
                      )),
                  toolbarHeight: MediaQuery.of(context).size.height * 0.17,
                  bottom: PreferredSize(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50, bottom: 20),
                            child: Text(
                              "Make New Friends",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: TabBar(
                              tabs: [
                                Tab(
                                  child: Text(
                                    'All',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFFDAE4E8),
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Tab(
                                    child: Text(
                                      'For you',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                              indicator: BoxDecoration(
                                color: Color(0xFFDAE4E8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              indicatorPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                            ),
                          )
                        ],
                      ),
                      preferredSize: Size.fromHeight(
                          MediaQuery.of(context).size.height * 0.11)),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.72,
                    child: AzListView(
                      padding: EdgeInsets.all(16),
                      data: items,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return _buildListItem(item);
                      },
                      indexBarOptions: IndexBarOptions(
                          needRebuild: true,
                          selectItemDecoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          indexHintAlignment: Alignment.centerRight,
                          indexHintOffset: Offset(30, 0),
                          selectTextStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      indexHintBuilder: (context, tag) => Container(
                          width: 30, height: 30, color: Color(0xFFDAE4E8)),
                      indexBarData: [],
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
        Scaffold(
          body: Stack(children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  floating: true,
                  snap: true,
                  leading: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  centerTitle: true,
                  title: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 50, top: 5),
                      child: Container(
                        width: _size.width * 0.8,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.grey,
                            onChanged: (v) {},
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for People",
                                icon: Icon(Icons.search, color: Colors.grey),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 1))),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30)),
                      )),
                  toolbarHeight: MediaQuery.of(context).size.height * 0.17,
                  bottom: PreferredSize(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50, bottom: 20),
                            child: Text(
                              "Make New Friends",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: TabBar(
                              tabs: [
                                Container(
                                  width: 115,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFFDAE4E8),
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Tab(
                                    child: Text(
                                      'All',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'For you',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                              indicator: BoxDecoration(
                                  color: Color(0xFFDAE4E8),
                                  borderRadius: BorderRadius.circular(30)),
                              indicatorPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                            ),
                          )
                        ],
                      ),
                      preferredSize: Size.fromHeight(
                          MediaQuery.of(context).size.height * 0.11)),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.72,
                    child: AzListView(
                      padding: EdgeInsets.all(16),
                      data: items,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return _buildListItem(item);
                      },
                      indexBarOptions: IndexBarOptions(
                          needRebuild: true,
                          selectItemDecoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          indexHintAlignment: Alignment.centerRight,
                          indexHintOffset: Offset(30, 0),
                          selectTextStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      indexHintBuilder: (context, tag) => Container(
                          width: 30, height: 30, color: Color(0xFFDAE4E8)),
                      indexBarData: [],
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ]),
    );
  }

  Widget _buildListItem(_AZItem item) {
    final tag = item.getSuspensionTag();
    final offstage = !item.isShowSuspension;
    return Column(
      children: [
        Offstage(offstage: offstage, child: buildHeader(tag)),
        ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            subtitle: Text("Working at Queens"),
            leading: CircleAvatar(
              backgroundColor: Color(0xFFDAE4E8),
              foregroundColor: Colors.white,
              radius: 30,
              child: Icon(
                Icons.person_rounded,
                color: Colors.white,
              ),
            ),
            title: Text(
              item.title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            trailing: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFDAE4E8),
                  boxShadow: kElevationToShadow[3]),
              child: Center(
                  child: Text(
                'Add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
            onTap: () {},
            onLongPress: () {}),
      ],
    );
  }

  Widget buildHeader(String tag) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      child: Text(
        "$tag",
        softWrap: false,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
    ;
  }
}
