import 'dart:io';
import '../models/user.dart';

class AuthService {
  static List<User> registeredUsers = [];

  void registerUserFromPrompt() {
    print('Enter your username:');
    var username = stdin.readLineSync()!;

    print('Enter your password:');
    var password = stdin.readLineSync()!;

    _registerUser(username, password);
  }

  void _registerUser(String username, String password) {
    var newUser = User(username, password);
    registeredUsers.add(newUser);
    print('User registered successfully!');
  }

  User? _authenticateUser(String username, String password) {
    try {
      return registeredUsers.firstWhere((u) => u.username == username && u.password == password);
    } catch (e) {
      print('Authentication failed. Invalid username or password.');
      return null;
    }
  }

  void updateUserFromPrompt() {
    print('Enter your username:');
    var username = stdin.readLineSync()!;

    print('Enter your new password:');
    var newPassword = stdin.readLineSync()!;

    _updateUser(username, newPassword);
  }

  void _updateUser(String username, String newPassword) {
    if (registeredUsers.isNotEmpty) {
      var authenticatedUser = _authenticateUser(username, newPassword);

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
    if (registeredUsers.isEmpty) {
      print('No registered users.');
    } else {
      print('Registered users:');
      for (var user in registeredUsers) {
        print('Username: ${user.username}, Password: ${user.password}');
      }
    }
  }
}