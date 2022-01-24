import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpmg/app/service/person/person_service.dart';

class ManagePersonController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final cpf = TextEditingController();
  final matricula = TextEditingController();
  final PersonService _personService;

  dynamic personArgument = Get.arguments;

  ManagePersonController({
    required PersonService personService,
  }) : _personService = personService;

  @override
  void onInit() async {
    super.onInit();
    editMode();
  }

  editMode() {
    if (personArgument != null) {
      email.text = personArgument.email;
      cpf.text = personArgument.cpf;
      matricula.text = personArgument.matricula.toString();
    }
  }

  Future<int?> save(
      {required String cpf,
      required int matricula,
      required String email}) async {
    int? id;
    if (kDebugMode) {
      print('dentro do save');
    }
    try {
      _personService.save(matricula, cpf, email).then((value) {
        id = value;
      });

      return id;
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }

      if (kDebugMode) {
        print(s);
      }
      Get.showSnackbar(const GetSnackBar(
          title: 'erro', message: 'Infelizmente houve um erro'));
    }

    return 0;
  }

  updatePerson(
      {required id,
      required String cpf,
      required int matricula,
      required String email}) async {
    try {
      _personService.updatePerson(id, matricula, cpf, email).then((value) {
        id = value;
      });

      return id;
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }

      if (kDebugMode) {
        print(s);
      }
      Get.showSnackbar(const GetSnackBar(
          title: 'erro', message: 'Infelizmente houve um erro'));
    }

    return 0;
  }
}
