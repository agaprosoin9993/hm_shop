
import 'package:get/state_manager.dart';
import 'package:hm_shop/viewmodels/user.dart';

//共享对象，需要响应更新
class UserController extends GetxController{
  var user = UserInfo.fromJSON({}).obs;//被监听了 取值user.value
  updateUserInfo(UserInfo newUser){//更新用户信息
    user.value = newUser;
  }
}