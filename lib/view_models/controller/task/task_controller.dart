import 'package:get/get.dart';

class TaskController extends GetxController {
  var isLoading = true.obs;
  var cartItems = [].obs;

  // Function to fetch cart data from the API
  Future<void> fetchCartData() async {
    isLoading.value = true;
    // Replace this with your API call logic
    await Future.delayed(const Duration(seconds: 2));
    // Simulate fetching data
    cartItems.assignAll(['Item 1', 'Item 2', 'Item 3']);
    isLoading.value = false;
  }
}