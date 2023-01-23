class CustomValidator {
  static isName(String? value) {
    if (value == null || value == '') {
      return 'Nome inválido';
    }
    return null;
  }

  static isEmail(String? value) {
    if (value != null) {
      var emailValid =
          RegExp(r"\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b").hasMatch(value);

      if (!emailValid) {
        return 'E-mail inválido';
      }
    } else {
      return 'E-mail inválido';
    }

    return null;
  }

  static isPassword(String? value) {
    if (value == null || value == '') {
      return 'Senha inválida';
    }
    return null;
  }

  static isUserName(String? value) {
    if (value != null && value != '') {
      var userNameValid =
          RegExp(r"^[A-Z|a-z][A-Za-z|0-9|_]{4,20}$").hasMatch(value);

      if (!userNameValid) {
        return 'Nome de usuário inválido';
      }

      return null;
    } else {
      return 'Nome de usuário inválido';
    }
  }
}
