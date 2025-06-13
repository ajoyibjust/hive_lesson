import 'package:get_it/get_it.dart';
import 'package:hive_lesson/core/interceptor/interceptor.dart';
import 'package:hive_lesson/features/data/repository/products_repository_impl.dart';
import 'package:hive_lesson/features/presentation/bloc/products_bloc.dart';

final sl = GetIt.instance;

Future<void> serviceLocator() async {
  _client();
  _styles();
  _datasources();
  _repositories();
  _usecase();
  _blocs();
}

void _blocs() {
  sl.registerFactory(() => ProductsBloc(sl<ProductsRepositoryImpl>()));
}

void _usecase() {}

void _repositories() {
  sl.registerLazySingleton(() => ProductsRepositoryImpl(dio: sl<DioClient>()),);
}

void _datasources() {}

void _styles() {}

void _client() {
  sl.registerFactory(() => DioClient());
}
