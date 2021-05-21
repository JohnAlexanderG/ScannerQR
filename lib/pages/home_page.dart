import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Providers
import 'package:scannerqr/providers/ui_provider.dart';
import 'package:scannerqr/providers/db_provider.dart';
import 'package:scannerqr/providers/scan_list_provider.dart';
// Pages
import 'package:scannerqr/pages/mapas_page.dart';
import 'package:scannerqr/pages/direcciones_page.dart';
// Widgets
import 'package:scannerqr/widgets/custom_navigatorbar.dart';
import 'package:scannerqr/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el _selectedMenuOpt del UIProvider
    final _uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = _uiProvider.selectedMenuOpt;

    // TMP Leer bd;

    // final tempScan = new ScanModel(valor: 'http://www.google.com');
    // DBProvider.db.nuevoScan(tempScan);

    // DBProvider.db.getScanById(7).then((scan) => print(scan.valor));

    DBProvider.db.getAllScans().then(print);

    // DBProvider.db.deleteAllScan().then(print);

    // Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansByType('geo');
        return MapasPage();
        break;
      case 1:
        scanListProvider.cargarScansByType('http');
        return DireccionesPage();
        break;
      default:
        return MapasPage();
    }
  }
}
