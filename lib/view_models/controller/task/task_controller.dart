import 'package:get/get.dart';

class TaskController extends GetxController {
  var isLoading = true.obs;
  RxList<String> allItems = <String>[].obs;
  RxList<String> processingItems = <String>[].obs;
  RxList<String> completedItems = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    isLoading.value = true;

    // Simulate API call with fake data
    await Future.delayed(Duration(seconds: 1));

    // Generate fake data
    allItems.assignAll(List.generate(10, (index) => 'Item $index'));

    isLoading.value = false;
  }
  Future<void> fetchCartData() async {
    isLoading.value = true;

    // Simulate API call with fake data
    await Future.delayed(Duration(seconds: 1));

    // Generate fake data
    allItems.assignAll(List.generate(10, (index) => 'Item $index'));

    isLoading.value = false;
  }

  Future<void> fetchProcessingData() async {
    isLoading.value = true;

    // Simulate API call with fake data
    await Future.delayed(Duration(seconds: 1));

    // Generate fake data
    processingItems.assignAll(List.generate(5, (index) => 'Processing Item $index'));

    isLoading.value = false;
  }

  Future<void> fetchCompletedData() async {
    isLoading.value = true;

    // Simulate API call with fake data
    await Future.delayed(Duration(seconds: 1));

    // Generate fake data
    completedItems.assignAll(List.generate(3, (index) => 'Completed Item $index'));

    isLoading.value = false;
  }
}

