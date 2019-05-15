import 'net_url_path.dart';
import 'net_dio_util.dart';
import 'package:flutter_note/models/net_model.dart';

class DBRepos {
  Future<DBTop250Model> getTop250() async {
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil().request(
      Method.get,
      API.top250,
    );
    DBTop250Model res;
    if (baseResp.data != null) {
      res = DBTop250Model.fromJson(baseResp.data);
      return res;
    }
    return res;
  }
}
