class UserModel {
  String? firstName;
  String? lastName;
  String? password;
  String? medicalCondition;
  String? weight;
  String? gender;
  String? email;
  String? fitnessLevel;
  String? height;
  String? bmi;
  String? dob;

  UserModel(
      {firstName,
      lastName,
      password,
      medicalCondition,
      weight,
      gender,
      email,
      fitnessLevel,
      height,
      bmi,
      dob});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    medicalCondition = json['medical_condition'];
    weight = json['weight'];
    gender = json['Gender'];
    email = json['email'];
    fitnessLevel = json['fitness_level'];
    height = json['height'];
    bmi = json['bmi'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['password'] = password;
    data['medical_condition'] = medicalCondition;
    data['weight'] = weight;
    data['Gender'] = gender;
    data['email'] = email;
    data['fitness_level'] = fitnessLevel;
    data['height'] = height;
    data['bmi'] = bmi;
    data['dob'] = dob;
    return data;
  }
}

UserModel? user;
