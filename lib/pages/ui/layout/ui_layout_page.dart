import 'package:flutter/material.dart';
import 'package:flutter_note/utils/hx_kit.dart';
import 'package:flutter_note/common/ui_layout_type.dart';

import 'package:flutter_note/pages/ui/layout/ui_layout_row_col_page.dart';
import 'package:flutter_note/pages/ui/layout/ui_layout_stack_page.dart';

class UILayoutPage extends StatefulWidget {
  UILayoutPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UILayoutPageState();
  }
}

class _UILayoutPageState extends State<UILayoutPage>
    with SingleTickerProviderStateMixin {
  LayoutType _layoutType = LayoutType.rowCol;

  void _setState(LayoutType type) {
    setState(() {
      _layoutType = type;
    });
  }

  void _onTabSel(int idx) {
    switch (idx) {
      case 0:
        _setState(LayoutType.rowCol);
        break;
      case 1:
        _setState(LayoutType.stack);
        break;
    }
  }

  Color _tabColor({LayoutType selType}) {
    return _layoutType == selType ? Colors.orange : Colors.grey;
  }

  BottomNavigationBarItem _buildItem({IconData icon, LayoutType type}) {
    String text = layoutName(type);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _tabColor(selType: type),
      ),
      title: Text(
        text,
        style: TextStyle(color: _tabColor(selType: type)),
      ),
    );
  }

  Widget _buildBody() {
    LayoutType layoutType = _layoutType;
    switch (layoutType) {
      case LayoutType.rowCol:
        return UIRowColPage();
      case LayoutType.stack:
        return UIStackPage();
    }
    return null;
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
          icon: Icons.view_headline,
          type: LayoutType.rowCol,
        ),
        _buildItem(
          icon: Icons.format_size,
          type: LayoutType.stack,
        ),
      ],
      onTap: _onTabSel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
