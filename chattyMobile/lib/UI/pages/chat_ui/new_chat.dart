import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _AZItem extends ISuspensionBean {
  final String title;
  final String tag;

  _AZItem({required this.title, required this.tag});
  String getSuspensionTag() => tag;
}

class NewChat extends StatefulWidget {
  final List<String> items;
  const NewChat({Key? key, required this.items}) : super(key: key);

  @override
  _NewChatState createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
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
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              title: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 50, top: 5),
                  child: Container(
                    width: _size.width * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.grey,
                        onChanged: (v) {},
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
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
                        padding: EdgeInsets.only(left: 30, top: 3, bottom: 7),
                        child: Text(
                          "New message",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 75,
                        margin:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Color(0xFF78d1b6),
                            color: Color(0xFFDAE4E8)),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              "Create a group chat",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.white),
                              child: Center(
                                  child: Text(
                                ">",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ),
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
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  indexHintBuilder: (context, tag) => Container(
                      width: 30, height: 30, color: Color(0xFFDAE4E8)),
                  indexBarData: [],
                ),
              ),
            )
          ],
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
  }
}
