import 'package:kpmg/app/data/models/person_model.dart';
import 'package:kpmg/app/repositories/person/person_repository.dart';
import 'package:kpmg/app/service/person/person_service.dart';

class PersonServiceImpl implements PersonService {
  final PersonRepository _personRepository;
  PersonServiceImpl({
    required PersonRepository personRepository,
  }) : _personRepository = personRepository;
  @override
  Future<int> save(int matricula, String cpf, String email) async {
    int id = await _personRepository.save(matricula, cpf, email);
    return id;
  }

  @override
  Future<int> updatePerson(
      int id, int matricula, String cpf, String email) async {
    int newId = await _personRepository.updatePerson(id, matricula, cpf, email);
    return newId;
  }

  @override
  Future<List<PersonModel>> findAll() => _personRepository.findAll();

  @override
  Future<PersonModel?> findById(int id) => _personRepository.findById(id);

  @override
  Future<int> delete(int id) async {
    int oldId = await _personRepository.delete(id);
    return oldId;
  }
}
