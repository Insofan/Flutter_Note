import 'package:flutter/material.dart';

import 'package:flutter_note/utils/hx_kit.dart';

import 'package:flutter_note/ui/pages/ui/layout/ui_layout_home.dart';


class UIGrid extends StatelessWidget {
  final List<String> _itemList = [
    'Layout'
  ];

  final Map<String, Widget> _widgetMap = {
    'Layout': UILayout()
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI'),
      ),
      body: SafeArea(
        child: Container(
          color: HXKit().randColor(),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0
            ),
            itemBuilder: (BuildContext context, int index) {
              return _buildChildren(context, _itemList[index]);
            },
            itemCount: _itemList.length,
          ),
        ),
      ),
    );
  }

  Widget _buildChildren(BuildContext context, String title) {
    return new RaisedButton(
      child: Text(title),
      color: HXKit().randColor(),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _widgetMap[title],
          ),
        );
      },
    );
  }
}

