import 'package:flutter/material.dart';

import 'package:flutter_note/utils/hx_kit.dart';

import 'package:flutter_note/ui/pages/ui/layout/ui_layout_grid_page.dart';
import 'package:flutter_note/ui/pages/ui/hire/ui_hire_page.dart';
import 'package:flutter_note/ui/pages/ui/login/ui_login_page.dart';

class UIGrid extends StatelessWidget {
  final List<String> _itemList = [
    "Hire",
    "Login",
  ];

  final Map<String, Widget> _widgetMap = {
    "Hire": Hire(),
    "Login": Login(),
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
                crossAxisSpacing: HXKit.crossSpace,
                mainAxisSpacing: HXKit.crossSpace,
                crossAxisCount: 3,
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

