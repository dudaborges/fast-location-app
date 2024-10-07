import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_fast_location/src/shared/storage/local_storage.dart';
import 'package:app_fast_location/src/routes/app_routes.dart';
import 'package:app_fast_location/src/modules/initial/page/initial_page.dart';
import 'package:app_fast_location/src/modules/home/page/home_page.dart'; 
import 'package:app_fast_location/src/modules/history/page/history_page.dart';
import 'package:app_fast_location/src/modules/home/controller/cep_controller.dart'; // Importe o CepController
import 'package:app_fast_location/src/modules/home/service/cep_service.dart'; // Importe o CepService
import 'package:app_fast_location/src/modules/home/repositories/cep_repository.dart'; // Importe o CepRepository
import 'package:app_fast_location/src/modules/home/repositories/local_repository.dart'; // Importe o LocalRepository
import 'package:app_fast_location/src/http/dio_client.dart'; // Importe o DioClient

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  await LocalStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocalRepository localRepository = LocalRepository(); // Instancie o LocalRepository
    final DioClient dioClient = DioClient(); // Instancie o DioClient
    final CepRepository cepRepository = CepRepository(dioClient); // Passe o DioClient ao CepRepository
    final CepService cepService = CepService(cepRepository, localRepository); // Passe ambos ao CepService
    final CepController cepController = CepController(cepService); // Passe o CepService ao CepController

    return MaterialApp(
      title: 'FastLocation',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      initialRoute: AppRoutes.initial, 
      routes: {
        AppRoutes.initial: (context) => InitialPage(),
        AppRoutes.home: (context) => HomePage(cepController), // Passe o controller aqui
        AppRoutes.history: (context) => HistoryPage(), 
      },
    );
  }
}
