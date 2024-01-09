import '../models/user.dart';

class AuthService {
  static List<User> registeredUsers = [];

  static User? authenticateUser(String username, String password) {
    try {
      User authenticatedUser = registeredUsers.firstWhere((u) => u.username == username && u.password == password);
      
      _updateAuthenticationStatus(authenticatedUser, true);
      
      print('User authenticated successfully');
      return authenticatedUser;
    } catch (e) {
      print('Authentication failed. Invalid username or password.');
      return null;
    }
  }

  static void _updateAuthenticationStatus(User user, bool status) {
    user.isAuthenticated = status;
  }
}