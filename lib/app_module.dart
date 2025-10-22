import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/clients/database/database_client.dart';
import 'core/clients/database/sqflite_database_client_impl.dart';
import 'core/clients/http/app_http_client.dart';
import 'core/clients/http/app_http_client_impl.dart';
import 'core/routes.dart';
import 'data/repositories/database_users_repository/database_users_repository.dart';
import 'data/repositories/database_users_repository/database_users_repository_impl.dart';
import 'data/repositories/random_user/random_user_repository.dart';
import 'data/repositories/random_user/random_user_respository_impl.dart';
import 'ui/viewmodels/database_users/database_users_cubit.dart';
import 'ui/viewmodels/random_user/random_user_cubit.dart';
import 'ui/views/database/database_users_view.dart';
import 'ui/views/home/home_view.dart';
import 'ui/views/user_details/user_details_view.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    // Others
    Bind.instance<AppHttpClient>(AppHttpClientImpl(Dio())),
    Bind.singleton<DatabaseClient>((i) => SqfliteDatabaseClientImpl()),
    Bind.singleton<RouteObserver<ModalRoute<void>>>(
      (i) => RouteObserver<ModalRoute<void>>(),
    ),

    // Repositories
    Bind.factory<RandomUserRepository>((i) => RandomUserRepositoryImpl(i())),
    Bind.factory<DatabaseUsersRepository>(
      (i) => DatabaseUsersRepositoryImpl(i()),
    ),

    // Cubits
    Bind.factory<RandomUserCubit>((i) => RandomUserCubit(i())),
    Bind.factory<DatabaseUsersCubit>((i) => DatabaseUsersCubit(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Routes.home, child: (_, _) => HomeView()),
    ChildRoute(Routes.databaseUsers, child: (_, _) => DatabaseUsersView()),
    ChildRoute(
      Routes.userDetails,
      child: (_, args) => UserDetailsView(params: args.data),
    ),
  ];
}
