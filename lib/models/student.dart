class Student {
  final int id;
  final String firstName;
  final String lastName;

  const Student({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
