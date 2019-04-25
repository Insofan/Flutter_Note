import 'package:flutter/material.dart';

import 'package:flutter_note/utils/hx_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_note/net/net_dio_util.dart';
import 'package:flutter_note/net/net_model.dart';
import 'package:flutter_note/net/net_repos.dart';

class DBTop250 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top 250"),
      ),
      body: DBTop250Grid(),
    );
  }
}

class DBTop250Grid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DBTop250GridState();
  }
}

class DBTop250GridState extends State<DBTop250Grid> {
  final Future<DBTop250Model> dbTop250Model = DBRepos().getTop250();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DBTop250Model>(
        future: dbTop250Model,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                if (snapshot.hasData && snapshot.data.subjects[index] != null) {
                  return _buildMovieCard(context, snapshot.data.subjects[index]);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
              itemCount:  snapshot.data.subjects.length,
          );
        });
  }

  Widget _buildMovieCard(
      BuildContext context, Subjects subject) {
    return Card(
      elevation: 1,
      color: HXKit().randColor(),
//      child: Text('${snapshot.data.count}'),
      child: Text('${subject.title}'),
    );
  }
}
