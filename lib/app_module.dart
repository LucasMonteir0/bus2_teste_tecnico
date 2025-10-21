import 'package:bus2_teste_tecnico/core/clients/http/app_http_client.dart';
import 'package:bus2_teste_tecnico/core/clients/http/app_http_client_impl.dart';
import 'package:bus2_teste_tecnico/ui/views/details/details_view.dart';
import 'package:bus2_teste_tecnico/ui/views/home/home_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/routes.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.instance<AppHttpClient>(AppHttpClientImpl(Dio())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Routes.home, child: (_, _) => HomeView()),
    ChildRoute(
      Routes.details,
      child: (_, args) => DetailsView(params: args.data),
    ),
  ];
}
