import 'package:flutter/material.dart';
import 'package:flutter_note/utils/hx_kit.dart';

class FBA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ////centerDocked 底部中间
    ////endDocked 底部右侧
    ////centerFloat 中间偏上
    ////endFloat 底部偏上
    return Scaffold(
      appBar: AppBar(
        title: new Text('Floating Action Button'),
      ),
      body: Scaffold(
//          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//          floatingActionButton: FloatingActionButton(
//            child: Icon(Icons.add),
//            onPressed: () {},
//          ),
      ),

//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//      floatingActionButton: FloatingActionButton(
//        onPressed: () => print("FloatingActionButton"),
//        child: Text("button"),
////        mini: true,
//      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: FloatingActionButton(
          child: Icon(Icons.print),
          onPressed: (){},
        ),
      ),
    );
  }
}