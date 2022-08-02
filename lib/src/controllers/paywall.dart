import 'package:get/get.dart';

class PaywallController extends GetxController {
  final _loading = false.obs;

  bool get loading => _loading.value;
  set setLoading(bool value) => _loading.value = value;

  baseFunction(Function? currentFunction) async {
    setLoading = true;
    if (currentFunction != null) await currentFunction();
    setLoading = false;
  }
}
