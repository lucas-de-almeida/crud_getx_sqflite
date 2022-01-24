import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpmg/app/data/database/sqlite_adm_connection.dart';
import 'package:kpmg/app/data/models/person_model.dart';
import 'package:kpmg/app/service/person/person_service.dart';

class HomeController extends GetxController {
  //variavel que controla o loading
  RxBool loading = false.obs;

  final sqliteAdmConnection = SqliteAdmConnection();

  final PersonService _personService;
  HomeController({required PersonService personService})
      : _personService = personService;

  RxList<PersonModel> personModelTotal = <PersonModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance?.addObserver(sqliteAdmConnection);

    loadTotalPerson();
    update();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
    loadTotalPerson();
  }

  void loadTotalPerson() {
    loading(true);

    _personService.findAll().then((value) {
      personModelTotal.assignAll(value);

      loading(false);
    });
  }

  Future<int> deletePerson(int id) async {
    late int oldId;
    try {
      _personService.delete(id).then((value) {
        oldId = value;
      });
      Get.showSnackbar(GetSnackBar(
        margin: const EdgeInsets.all(20),
        borderRadius: 20,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        title: 'Item Excluido',
        message: 'O item foi excluido com sucesso',
        backgroundColor: Colors?.red[200] ?? Colors.red,
      ));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }

      if (kDebugMode) {
        print(s);
      }
      Get.showSnackbar(GetSnackBar(
        margin: const EdgeInsets.all(20),
        borderRadius: 20,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        title: 'Erro ao excluir',
        message: 'Não foi possivel excluir o item',
        backgroundColor: Colors?.red[400] ?? Colors.red,
      ));
      oldId = 0;
    }

    loadTotalPerson();
    return oldId;
  }
}
