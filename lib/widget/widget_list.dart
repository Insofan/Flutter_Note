import 'package:flutter/material.dart';
import 'package:flutter_note/widget/animated_container/ani_container.dart';

class WidgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Widget List'),
      ),
      body: SafeArea(
          child: new ItemList(),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ItemListState();
}

class ItemListState extends State<ItemList> {
  final List<String> titleList = [
    'Animated Container',
  ];

  final Map<String, Widget> widgetMap = {
    'Animated Container': AniContainer(),
  };

  @override
  Widget build(BuildContext context) {
    return new ListView.separated(
      itemCount: titleList.length,
      padding: const EdgeInsets.all(6.0),
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(context, titleList[i]);
      },
      separatorBuilder: (BuildContext context, int i) {
        return new Divider(color: Colors.grey);
      },
    );
  }

  Widget _buildRow(BuildContext context, String title) {
    return ListTile(
      title: new Text(
        title,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widgetMap[title])
        );
      },
    );
  }
}