import 'package:kpmg/app/data/models/person_model.dart';

abstract class PersonRepository {
  Future<int> save(
    int matricula,
    String cpf,
    String email,
  );
  Future<List<PersonModel>> findAll();
  Future<PersonModel?> findById(int id);

  updatePerson(int id, int matricula, String cpf, String email) {}

  delete(int id) {}
}
