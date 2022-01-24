// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHeader extends StatelessWidget {
  String routeAdd;
  String? routeDelete;
  String routeEdit;
  dynamic argumentsEdit;
  String? routeRefresh;
  CustomHeader({
    Key? key,
    required this.routeAdd,
    this.routeDelete,
    required this.routeEdit,
    required this.argumentsEdit,
    this.routeRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .2,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(
                      routeAdd,
                    );
                  },
                  icon: const Icon(Icons.add_outlined),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Adicionar'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Deletar'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(routeAdd, arguments: argumentsEdit);
                  },
                  icon: const Icon(Icons.edit_outlined),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Editar'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh_outlined),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Atualizar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
