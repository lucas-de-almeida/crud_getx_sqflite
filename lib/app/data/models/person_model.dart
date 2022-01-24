class PersonModel {
  int id;
  int matricula;
  String cpf;
  String email;
  PersonModel({
    required this.id,
    required this.matricula,
    required this.cpf,
    required this.email,
  });
  factory PersonModel.loadFromDB(Map<String, dynamic> person) {
    return PersonModel(
      id: person['id'],
      matricula: person['matricula'],
      cpf: person['cpf'],
      email: person['email'],
    );
  }
}
