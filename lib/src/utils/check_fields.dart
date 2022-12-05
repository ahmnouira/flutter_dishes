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
