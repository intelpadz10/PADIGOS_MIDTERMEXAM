import 'package:get_it/get_it.dart';
import 'package:padigos_midtermexam_shoppingapp/service/api_service.dart';

final locator = GetIt.instance;

void setupLocators() {
  locator.registerSingleton<ApiService>(ApiService());
}
