import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weapon/controller/product_controller.dart';
import 'package:weapon/widgets/row_product.dart';

class ProductScreen extends StatelessWidget {
  late ProductController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Escobar',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Obx(
            () => controller.cart.isNotEmpty
                ? InkWell(
                    onTap: () => Get.toNamed('/cart'),
                    child: badges.Badge(
                      badgeColor: Color.fromARGB(255, 55, 0, 255),
                      badgeContent: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Text(
                          '${controller.cart.length}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: const Icon(Icons.shopping_cart),
                    ),
                  )
                : const Icon(Icons.shopping_cart),
          ),
          const SizedBox(width: 20.0),
          InkWell(
            onTap: () => controller.logout(),
            child: const Icon(Icons.power_settings_new),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 50, 0, 100)
              ]),
        ),
        padding: const EdgeInsets.all(30.0),
        child: Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(10.0),
            separatorBuilder: (_, __) => const Divider(color: Colors.white),
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return RowProduct(
                airsoft: controller.list[index],
                controller: controller,
              );
            },
          ),
        ),
      ),
    );
  }
}
