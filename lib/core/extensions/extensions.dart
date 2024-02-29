extension EmailValidator on String {
  bool isValidEmail() {
    RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    RegExp passwordRegExp = RegExp(r'^.{6,}$');
    return passwordRegExp.hasMatch(this);
  }
}