String checkAuthFields(String? email, String? password) {
  String error = '';
  if (email == null || password == null) {
    error = 'Fields are required.';
  } else if (email.isEmpty) {
    error = 'Email is empty.';
  } else if (password.isEmpty) {
    error = 'Password is empty.';
  }

  return error;
}

String checkField(String? field) {
  String error = '';
  if (field == null) {
    error = 'field is required.';
  } else if (field.isEmpty) {
    error = 'Email is empty.';
  }

  return error;
}
