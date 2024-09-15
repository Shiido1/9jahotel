import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../ui/screens/dashboard.dart';
import '../../../ui/screens/first_screen.dart';
import '../../../ui/screens/forgot_password/first_forgot_password_screen.dart';
import '../../../ui/screens/login_screen.dart';
import '../../../ui/screens/reset_password.dart';
import '../../api_folder/auth_api.dart';
import '../../api_folder/booking_api.dart';
import '../../connect_end/contract/booking_contract_implemention.dart';
import '../../connect_end/contract/contract_implementation.dart';
import '../../connect_end/repo/booking_repo_implementation.dart';
import '../../connect_end/repo/repo_implementation.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../../connect_end/view_model/bookings_view_model.dart';
import '../manager/shared_preference.dart';
import '../network/network_service.dart';


@StackedApp(routes: [
  MaterialRoute(page: Dashboard, initial: true),
  MaterialRoute(page: FirstScreen, initial: false),
  MaterialRoute(page: LoginScreen, initial: false),
  MaterialRoute(page: FirstForgotPasswordScreen, initial: false),
  MaterialRoute(page: ResetPassword, initial: false),

], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: SharedPreferencesService),
  LazySingleton(classType: NetworkService),
  LazySingleton(classType: AuthApi),
  LazySingleton(classType: BookingApi),
  LazySingleton(classType: AuthContractsImpl),
  LazySingleton(classType: BookingContractsImpl),
  LazySingleton(classType: AuthRepoImpl),
  LazySingleton(classType: BookingRepoImpl),
  LazySingleton(classType: AuthViewModel),
  LazySingleton(classType: BookingsViewModel),
], logger: StackedLogger())
class App {}