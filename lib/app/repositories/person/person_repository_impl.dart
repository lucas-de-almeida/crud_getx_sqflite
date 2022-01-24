import 'package:kpmg/app/data/database/sqlite_connection_factory.dart';
import 'package:kpmg/app/data/models/person_model.dart';
import 'package:kpmg/app/repositories/person/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;
  PersonRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<int> save(int matricula, String cpf, String email) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    int id = await conn.insert('person', {
      'id': null,
      'matricula': matricula,
      'cpf': cpf,
      'email': email,
    });
    return id;
  }

  @override
  updatePerson(int id, int matricula, String cpf, String email) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    int newId = await conn.rawUpdate(
        'UPDATE person SET matricula = ?, email = ?, cpf = ? WHERE id = ?',
        [matricula, email, cpf, id]);
    return newId;
  }

  @override
  Future<List<PersonModel>> findAll() async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery('select * from person');
    return result.map((e) => PersonModel.loadFromDB(e)).toList();
  }

  @override
  Future<PersonModel?> findById(int id) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final result =
        await conn.rawQuery('select * from person where id = ?', [id]);
    return result
        .map((e) {
          PersonModel.loadFromDB(e);
        })
        .toList()
        .first;
  }

  @override
  delete(int id) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final oldId = await conn.rawDelete('DELETE FROM person WHERE id = ?', [id]);

    return oldId;
  }
}
