import 'package:get/get.dart';
import 'package:kpmg/app/data/database/sqlite_connection_factory.dart';
import 'package:kpmg/app/repositories/person/person_repository.dart';
import 'package:kpmg/app/repositories/person/person_repository_impl.dart';
import 'package:kpmg/app/service/person/person_service.dart';
import 'package:kpmg/app/service/person/person_service_impl.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SqliteConnectionFactory(), permanent: true);
    Get.put<PersonRepository>(
        PersonRepositoryImpl(sqliteConnectionFactory: Get.find()),
        permanent: true);
    Get.put<PersonService>(PersonServiceImpl(personRepository: Get.find()),
        permanent: true);

    Get.lazyPut<HomeController>(
      () => HomeController(personService: Get.find()),
    );
  }
}
