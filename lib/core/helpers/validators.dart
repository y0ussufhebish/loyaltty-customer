
class Validators {
  static String? emailValidator(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    final capRegex = RegExp(r'[A-Z]');
    final smallRegex = RegExp(r'[a-z]');
    final numRegex = RegExp(r'[0-9]');
    final specialRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (value!.isEmpty) {
      return 'Password can\'t be empty';
    } else if (value.length < 8){
      return 'Password must be at least 8 characters';
    } else if (!capRegex.hasMatch(value)){
      return 'Password must contain at least one capital letter';
    } else if (!smallRegex.hasMatch(value)){
      return 'Password must contain at least one small letter';
    } else if (!numRegex.hasMatch(value)){
      return 'Password must contain at least one number';
    } else if (!specialRegex.hasMatch(value)){
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? phoneValidator(
    String? value,
  ) {
    final numRegex = RegExp(r'[0-9]');
    if (value!.isEmpty) {
      return 'Phone number can\'t be empty';
    } else if (!numRegex.hasMatch(value)){
      return 'Password must contain at least one number';
    }
    return null;
  }

  static String? cantBeEmpty(String? value) {
    if (value!.isEmpty) {
      return 'This field can\'t be empty';
    }
    return null;
  }

  static String? letNull(String? value) {
    return null;
  }
}
