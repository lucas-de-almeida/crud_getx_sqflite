import 'package:kpmg/app/data/models/person_model.dart';

abstract class PersonService {
  Future<int> save(
    int matricula,
    String cpf,
    String email,
  );
  Future<int> updatePerson(
    int id,
    int matricula,
    String cpf,
    String email,
  );
  Future<int> delete(
    int id,
  );
  Future<List<PersonModel>> findAll();

  Future<PersonModel?> findById(int id);
}
