class UserRequest {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? birthdate;
  final String? gender;
  final String? password;

  UserRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.birthdate,
    this.gender,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (firstName != null) data['first_name'] = firstName;
    if (lastName != null) data['last_name'] = lastName;
    if (email != null) data['email'] = email;
    if (birthdate != null) data['birthdate'] = birthdate;
    if (gender != null) data['gender'] = gender;
    if (password != null) data['password'] = password;
    return data;
  }
}
