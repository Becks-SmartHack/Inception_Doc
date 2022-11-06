class Patient {
  late String fullName;
  late int age;
  late String description;

  Patient(this.fullName, this.age, this.description);

  factory Patient.fromJson (dynamic json) {
    return Patient(json['full_name'] as String, json['age'] as int, json['description'] as String);
  }

  Map toJson () => {
    'full_name': fullName,
    'age': age,
    'description': description,
  };
}