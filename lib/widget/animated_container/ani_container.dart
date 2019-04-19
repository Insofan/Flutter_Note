import 'package:flutter/material.dart';
import 'package:flutter_note/utils/hx_kit.dart';

class AniContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Animated Container'),
      ),
      body: SafeArea(
      child: new AniWidget()
      ),
    );
  }

  Widget _buildAniContainer() {
    return new AnimatedContainer(
      color: HXKit().randColor(),
      duration: Duration(seconds: HXKit.durSec),
      curve: Curves.bounceIn,
      height: HXKit.recHeight,
      width: HXKit.recWidth,
    );
  }
}

class AniWidget extends StatefulWidget {
  AniWidget() : super();
  @override
  AniWidgetState createState() => AniWidgetState();
}

class AniWidgetState extends State<AniWidget> {

  Color _color = Colors.red;
  var _height = 100.0;
  var _width = 100.0;
  var _isFirstCrossFadeEnabled = false;
  var _opacity = 0.0;

  _aniContainer() {
    setState(() {
      _color = _color == Colors.red ? HXKit().randColor() : Colors.red;
      _height = _height == 100 ? 200 : 100;
      _width = _width == 100 ? 200 : 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: HXKit.paddingTop),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.bounceOut,
            color: _color,
            height: _height,
            width: _width,
            child: Center(
                child: new Text('Click Animated')
            ),
          ),
          SizedBox(height: HXKit.paddingTop),
          FloatingActionButton(
            onPressed: _aniContainer,
            child: Icon(Icons.change_history),
          )
        ],
      ),
    );
  }
}
