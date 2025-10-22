import 'package:bus2_teste_tecnico/core/clients/database/database_client.dart';
import 'package:bus2_teste_tecnico/core/clients/database/sqflite_database_client_impl.dart';
import 'package:bus2_teste_tecnico/ui/viewmodels/random_user/random_user_cubit.dart';
import 'package:bus2_teste_tecnico/ui/views/database/database_users_view.dart';
import 'package:bus2_teste_tecnico/ui/views/home/home_view.dart';
import 'package:bus2_teste_tecnico/ui/views/user_details/user_details_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/clients/http/app_http_client.dart';
import 'core/clients/http/app_http_client_impl.dart';
import 'core/routes.dart';
import 'data/repositories/random_user/random_user_repository.dart';
import 'data/repositories/random_user/random_user_respository_impl.dart';

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

    // Cubits
    Bind.factory<RandomUserCubit>((i) => RandomUserCubit(i())),
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
