// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kpmg/app/core/widgets/custom_form_field.dart';
import 'package:kpmg/app/routes/app_pages.dart';
import 'package:validatorless/validatorless.dart';

import '../controllers/manage_person_controller.dart';

class ManagePersonView extends GetView<ManagePersonController> {
  ManagePersonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClientView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 20),
                child: CustomFormField(
                  label: 'E-mail',
                  controller: controller.email,
                  validator: Validatorless.multiple([
                    Validatorless.email('E-mail inválido por favor verifique'),
                    Validatorless.required('E-mail obrigatorio'),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormField(
                  onlyNumber: true,
                  label: 'Cpf',
                  controller: controller.cpf,
                  validator: Validatorless.multiple([
                    Validatorless.cpf('Por favor informe um cpf válido'),
                    Validatorless.required('Cpf obrigatorio'),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormField(
                  onlyNumber: true,
                  label: 'Matricula',
                  controller: controller.matricula,
                  validator: Validatorless.multiple([
                    Validatorless.min(1, 'Minimo 1 caracteres'),
                    Validatorless.required('Numero de matricula obrigatorio'),
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                          backgroundColor: MaterialStateProperty.all(
                              context.theme.primaryColor)),
                      onPressed: () {
                        Get.offNamed(Routes.HOME);
                      },
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                          backgroundColor: MaterialStateProperty.all(
                              context.theme.primaryColor)),
                      onPressed: () {
                        final formValid =
                            controller.formKey.currentState?.validate() ??
                                false;
                        if (formValid) {
                          controller.personArgument == null
                              ? controller.save(
                                  cpf: controller.cpf.text,
                                  matricula:
                                      int.tryParse(controller.matricula.text) ??
                                          0,
                                  email: controller.email.text,
                                )
                              : controller.updatePerson(
                                  id: controller.personArgument.id,
                                  cpf: controller.cpf.text,
                                  matricula:
                                      int.tryParse(controller.matricula.text) ??
                                          0,
                                  email: controller.email.text,
                                );

                          Get.offNamed(Routes.HOME);

                          Get.showSnackbar(GetSnackBar(
                            margin: const EdgeInsets.all(20),
                            borderRadius: 20,
                            animationDuration: const Duration(seconds: 1),
                            duration: const Duration(seconds: 2),
                            snackPosition: SnackPosition.TOP,
                            title: controller.personArgument == null
                                ? 'Salvo com sucesso'
                                : 'Editado com sucesso',
                            message: 'Suas informações foram salvas',
                            backgroundColor: Theme.of(context).primaryColor,
                          ));
                        }
                      },
                      child: Text(
                        controller.personArgument != null
                            ? 'Atualizar'
                            : 'Salvar',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
