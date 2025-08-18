import 'package:facebook_clone/core/service/remote/auth/register/register_service.dart';
import 'package:facebook_clone/features/auth/model/user_model.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final RegisterService registerService;

  UserModel userModel = UserModel();

  AuthViewModel({required this.registerService}) {
    _updateDate(_selectedDate);
  }
  //variables
  bool isLoading = false;
  String? error;
  DateTime _selectedDate = DateTime.now();
  String _formattedDate = '';
  int _age = 0;
  String? _selectedGender;
  bool isShow = false;
  bool isCreated = false;
  bool _saveInfo = false;

  //getters
  UserModel get user => userModel;
  DateTime get selectedDate => _selectedDate;
  String get formattedDate => _formattedDate;
  String? get selectedGender => _selectedGender;
  bool? get isShowPassword => isShow;
  bool get saveInfo => _saveInfo;
  bool get isCreatedAccount => isCreated;

  //password
  void togglePassword() {
    isShow = !isShow;
    notifyListeners();
  }

  //gender
  void selectGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  bool isSelected(String gender) => _selectedGender == gender;
  void setDate(DateTime date) {
    _updateDate(date);
  }

  //birthday
  void _updateDate(DateTime date) {
    _selectedDate = date;
    _age = _calculateAge(date);
    _formattedDate =
        "${_monthName(date.month)} ${date.day}, ${date.year} ($_age years old)";
    notifyListeners();
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }

  int _calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  //validation

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateBirthday(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your birthday';
    }
    if (_age < 13) {
      return 'You must be at least 13 years old';
    }
    return null;
  }

  String? validateName(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    if (value.length > 20) {
      return 'Name must be less than 20 characters';
    }
    return null;
  }

  String? validateGender(value) {
    if (value == null || value.isEmpty) {
      return 'Please select your gender';
    }
    return null;
  }

  //states

  void setFullName(String first, String last) {
    isLoading = true;
    notifyListeners();
    try {
      userModel = userModel.copyWith(fullName: "$first $last");

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = "Something went wrong";
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  void setEmail(String email) {
    isLoading = true;
    notifyListeners();
    try {
      userModel = userModel.copyWith(email: email);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = "Something went wrong";
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  void setPassword(String password) async {
    isLoading = true;
    notifyListeners();
    try {
      userModel = userModel.copyWith(password: password);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = "Something went wrong";
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  void setGender(String gender) {
    isLoading = true;
    notifyListeners();
    try {
      userModel = userModel.copyWith(gender: gender);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = "Something went wrong";
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  void setBirthday(String date) {
    isLoading = true;
    notifyListeners();
    try {
      userModel = userModel.copyWith(birthday: date);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = "Something went wrong";
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<bool> registerUser({bool saveInfo = false}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      await registerService.register(user: userModel, saveInfo: saveInfo).then((
        _,
      ) {
        _saveInfo = true;
      });

      isCreated = true;
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      error = e.toString();
      isLoading = false;
      _saveInfo = false;
      notifyListeners();
      return false;
    }
  }
}
