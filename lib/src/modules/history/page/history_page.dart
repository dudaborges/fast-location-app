import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_fast_location/src/modules/history/controller/history_controller.dart';
import 'package:app_fast_location/src/shared/colors/app_colors.dart';
import 'package:app_fast_location/src/shared/metrics/app_metrics.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = HistoryController();

  HistoryPage({Key? key}) : super(key: key) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Histórico de Endereços',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        color: AppColors.backgroundColor,
        padding: const EdgeInsets.all(AppMetrics.paddingMedium),
        child: Observer(
          builder: (_) {
            if (controller.addressHistory.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhum histórico encontrado',
                  style: TextStyle(color: AppColors.secondaryColor),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: controller.addressHistory.length,
                itemBuilder: (context, index) {
                  final address = controller.addressHistory[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: AppMetrics.paddingMedium),
                    padding: EdgeInsets.all(AppMetrics.paddingMedium),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ListTile(
                      title: Text(
                        '${address.logradouro}, ${address.bairro}',
                        style: TextStyle(color: AppColors.secondaryColor),
                      ),
                      subtitle: Text(
                        '${address.cidade} - ${address.uf}',
                        style: TextStyle(color: AppColors.secondaryColor),
                      ),
                      trailing: Text(
                        address.cep,
                        style: TextStyle(color: AppColors.secondaryColor),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
