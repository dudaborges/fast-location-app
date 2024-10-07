import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_fast_location/src/shared/storage/local_storage.dart';
import 'package:app_fast_location/src/routes/app_routes.dart';
import 'package:app_fast_location/src/modules/initial/page/initial_page.dart';
import 'package:app_fast_location/src/modules/home/page/home_page.dart'; 
import 'package:app_fast_location/src/modules/history/page/history_page.dart';
import 'package:app_fast_location/src/modules/home/controller/cep_controller.dart';
import 'package:app_fast_location/src/modules/home/service/cep_service.dart';
import 'package:app_fast_location/src/modules/home/repositories/cep_repository.dart';
import 'package:app_fast_location/src/modules/home/repositories/local_repository.dart';
import 'package:app_fast_location/src/http/dio_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  await LocalStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocalRepository localRepository = LocalRepository();
    final DioClient dioClient = DioClient();
    final CepRepository cepRepository = CepRepository(dioClient);
    final CepService cepService = CepService(cepRepository, localRepository);
    final CepController cepController = CepController(cepService);

    return MaterialApp(
      title: 'FastLocation',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      initialRoute: AppRoutes.initial, 
      routes: {
        AppRoutes.initial: (context) => InitialPage(),
        AppRoutes.home: (context) => HomePage(cepController),
        AppRoutes.history: (context) => HistoryPage(), 
      },
    );
  }
}
