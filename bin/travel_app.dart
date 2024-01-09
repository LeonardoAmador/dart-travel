import 'models/user.dart';
import './services/auth_user.dart';
void main(List<String> arguments) {
  User user1 = User.createUserFromPrompt();

  User.printUsers();
}
