import 'package:app_fast_location/src/shared/colors/app_colors.dart';
import 'package:app_fast_location/src/shared/metrics/app_metrics.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_fast_location/src/modules/home/components/last_address.dart';
import 'package:app_fast_location/src/modules/home/controller/cep_controller.dart';
import 'package:app_fast_location/src/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final CepController controller;

  HomePage(this.controller);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FastLocation',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        color: AppColors.backgroundColor,
        padding: const EdgeInsets.all(AppMetrics.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Localizar Endereço',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor,
              ),
            ),
            SizedBox(height: AppMetrics.paddingSmall),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cepController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Digite o CEP',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: AppMetrics.paddingSmall),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    final cep = _cepController.text;
                    if (cep.isNotEmpty) {
                      widget.controller.searchCep(cep);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Por favor, insira um CEP válido.')),
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: AppMetrics.paddingMedium),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (widget.controller.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (widget.controller.cepModel != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dados da Localização',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        SizedBox(height: AppMetrics.paddingSmall),
                        Container(
                          padding: EdgeInsets.all(AppMetrics.paddingMedium),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: LastAddress(address: widget.controller.cepModel!),
                        ),
                        SizedBox(height: AppMetrics.paddingMedium),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: Text('Traçar Rota'),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppMetrics.paddingMedium),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.history);
                  },
                  child: Text('Ver histórico de endereços'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }
}
