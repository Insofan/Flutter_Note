import 'package:flutter/material.dart';

import 'package:flutter_note/utils/hx_kit.dart';

class DBTop250 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top 250"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return _buildMovieCard(context, index);
          },
          itemCount: 20
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context,
      int index) {
    return Card(
      elevation: 1,
      color: HXKit().randColor(),
    );
  }
}

