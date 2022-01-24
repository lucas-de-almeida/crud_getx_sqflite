import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpmg/app/modules/home/controllers/home_controller.dart';
import 'package:kpmg/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_reaction_outlined),
        onPressed: () {
          Get.offNamed(Routes.MANAGE_PERSON);
        },
      ),
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Obx(() {
                  if (controller.loading.value == true) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.personModelTotal.length,
                    itemBuilder: (_, index) {
                      final personIndex = controller.personModelTotal[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.4,
                                      child: Column(
                                        children: [
                                          Text(personIndex.email),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text('Cpf: ' +
                                              UtilBrasilFields.obterCpf(
                                                  personIndex.cpf)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Matricula: ${personIndex.matricula}',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.offNamed(Routes.MANAGE_PERSON,
                                              arguments: personIndex);
                                        },
                                        icon: const Icon(Icons.edit_outlined)),
                                    IconButton(
                                        onPressed: () async {
                                          controller
                                              .deletePerson(personIndex.id)
                                              .then((value) {
                                            if (value != 0) {
                                              controller.personModelTotal
                                                  .removeAt(index);
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.delete_outline))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
