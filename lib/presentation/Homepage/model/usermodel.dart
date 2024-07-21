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
      {this.firstName,
      this.lastName,
      this.password,
      this.medicalCondition,
      this.weight,
      this.gender,
      this.email,
      this.fitnessLevel,
      this.height,
      this.bmi,
      this.dob});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['password'] = this.password;
    data['medical_condition'] = this.medicalCondition;
    data['weight'] = this.weight;
    data['Gender'] = this.gender;
    data['email'] = this.email;
    data['fitness_level'] = this.fitnessLevel;
    data['height'] = this.height;
    data['bmi'] = this.bmi;
    data['dob'] = this.dob;
    return data;
  }
}

UserModel? user;
