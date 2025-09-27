import 'package:fruits_hub/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firebase_services.dart';
import 'package:fruits_hub/core/services/firestore_services.dart';
import 'package:fruits_hub/feature/auth/data/repos/auth_repos_impl.dart';
import 'package:fruits_hub/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseServices>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthReposImpl(FirebaseAuthService(), getIt<FirebaseServices>()),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(getIt<FirebaseServices>()),
  );
}
