import 'dart:io';
import '../services/auth_user.dart';

class User {
  late String username;
  late String password;
  bool isAuthenticated = false;

  User.createUser(this.username, this.password) {
    AuthService.registeredUsers.add(this);
  }

  User.createUserFromPrompt() {
    print('Enter your username:');
    var username = stdin.readLineSync()!;

    print('Enter your password:');
    var password = stdin.readLineSync()!;

    if (_isValid(username, password)) {
      User.createUser(username, password);
      print('User registered successfully!');
    } else {
      print('Invalid username or password. User creation failed.');
    }
  }

  bool _isValid(String username, String password) {
    return username.isNotEmpty && password.isNotEmpty;
  }

  void updateUserFromPrompt() {
    print('Enter your new password:');
    var newPassword = stdin.readLineSync()!;

    if (_isValid(username, newPassword)) {
      _updateUser(newPassword);
    } else {
      print('Invalid username or password. Update failed.');
    }
  }

  void _updateUser(String newPassword) {
    if (AuthService.registeredUsers.isNotEmpty) {
      var authenticatedUser = AuthService.authenticateUser(username, password);

      if (authenticatedUser != null) {
        authenticatedUser.password = newPassword;
        print('User updated successfully');
      } else {
        print('User not found or authentication failed. Update failed.');
      }
    } else {
      print('No registered users.');
    }
  }
  
  static void printUsers() {
    if (AuthService.registeredUsers.isEmpty) {
      print('No registered users.');
    } else {
      print('Registered users:');
      for (var user in AuthService.registeredUsers) {
        print('Username: ${user.username}, Password: ${user.password}, Authenticated: ${user.isAuthenticated}');
      }
    }
  }
}