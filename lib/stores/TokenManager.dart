
import 'package:hm_shop/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager{
  Future<SharedPreferences> _getInstance() async{//返回持久化的实例对象
    return SharedPreferences.getInstance();
  }
  String _token="";
  Future<void> init() async{
    SharedPreferences prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? "";
  }
  Future<void> setToken(String val) async{
    SharedPreferences prefs = await _getInstance();
    prefs.setString(GlobalConstants.TOKEN_KEY, val);
    _token = val;
  }
  String getToken(){
    return _token;
  }
  Future<void> removeToken() async{
    SharedPreferences prefs = await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY);//磁盘
    _token = "";//内存
  }
}
final tokenManager = TokenManager();