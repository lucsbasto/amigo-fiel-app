import 'package:amigo_fiel/services/controllers/auth-controller.dart';
import 'package:amigo_fiel/services/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final authController = new AuthController();
  final Rx<User?> _user = Rx<User?>(null);
  User? get loggedUser => _user.value;

  @override
  onInit() {
    super.onInit();
    getCurrentUser();
  }

  void updateUser(User? newUser) {
    _user.value = newUser;
  }

  Future<void> getCurrentUser() async {
    final currentUser = await authController.getLoggedUser();
    _user.value = currentUser ?? User.guestUser;
  }
}
