import 'services/auth_user.dart';
void main(List<String> arguments) {
  var user1 = AuthService();
  var user2 = AuthService();

  user1.registerUserFromPrompt();
  user2.registerUserFromPrompt();
}
