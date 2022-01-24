import 'package:kpmg/app/data/database/migrations/migration.dart';

import 'package:sqflite/sqflite.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
    create table person(
      id INTEGER PRIMARY KEY autoincrement,
      matricula INTEGER not null,
      cpf varchar(500) not null,
      email varchar(500) not null
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
