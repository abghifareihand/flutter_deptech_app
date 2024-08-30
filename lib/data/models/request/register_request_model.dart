class RegisterRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String birthdate;
  final String gender;
  final String password;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthdate,
    required this.gender,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'birthdate': birthdate,
      'gender': gender,
      'password': password,
    };
  }
}
