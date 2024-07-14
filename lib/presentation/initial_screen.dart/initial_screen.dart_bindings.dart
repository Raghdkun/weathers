import 'package:get/get.dart';
import './initial_screen.dart_controller.dart';

class InitialScreenDartBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(InitialScreenController());
    }
}