import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/reponse/status.dart';
import '../../../res/components/general_exception.dart';
import '../../../res/components/internet_exception_widget.dart';
import '../../../view_models/controller/home/home_controller.dart';

class UserListWidget extends StatelessWidget {
  UserListWidget({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (homeController.rxRequestStatus.value) {
        case Status.LOADING:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case Status.ERROR:
          if (homeController.error.value == 'No internet') {
            return InternetExceptionWidget(
              onPress: () {
                homeController.refreshApi();
              },
            );
          } else {
            return GeneralExceptionWidget(onPress: () {
              homeController.refreshApi();
            }); // Return the Text widget
          }

        case Status.COMPLETED:
          return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(homeController
                          .userList.value.data![index].avatar
                          .toString()),
                    ),
                    title: Text(homeController
                        .userList.value.data![index].firstName
                        .toString()),
                    subtitle: Text(homeController
                        .userList.value.data![index].email
                        .toString()),
                    trailing: Text(homeController.userList.value.data![index].id
                        .toString()),
                  ),
                );
              });
      }
    });
  }
}
