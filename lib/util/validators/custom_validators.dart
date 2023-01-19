class CustomValidator {
  static isEmail(String value) {
    RegExp regex = RegExp(r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");

    if (value.isEmpty) {
      return 'E-mail inválido';
    }

    return null;
  }

  static isPassword(String value) {
    return null;
  }

  static isUserName(String value) {
    return null;
  }
}
