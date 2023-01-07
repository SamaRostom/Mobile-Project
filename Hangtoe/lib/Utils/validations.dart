bool isName(String name) {
  String p =
      r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$";

  RegExp regExp = RegExp(p);
  return regExp.hasMatch(name);
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}

bool isPassword(String password) {
  var strongRegex = RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{6,})");
  if (strongRegex.hasMatch(password)) {
    return true;
  } else {
    return false;
  }
}

bool isNull(String value) {
  if (value.isEmpty) {
    return false;
  } else {
    return true;
  }
}

bool isLength(String value) {
  if (value.length <= 2) {
    return false;
  } else {
    return true;
  }
}

bool checkString(String value) {
  if (value.contains(RegExp(r'^[a-zA-Z]'))) {
    return true;
  } else {
    return false;
  }
}