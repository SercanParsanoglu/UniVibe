import 'package:get_it/get_it.dart';
import 'package:uni_social/feature/provider/cache_user_provider.dart';
import 'package:uni_social/feature/view_model/sign_up_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<CacheUserProvider>(CacheUserProvider());
  locator.registerSingleton<SignUpViewModel>(SignUpViewModel());
}
