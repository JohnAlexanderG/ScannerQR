import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:scannerqr/providers/scan_list_provider.dart';
import 'package:scannerqr/utils/utils.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        // final barcodeScanRes = 'https://johnalexanderg.dev';
        // final barcodeScanRes = 'geo:4.491100,-74.115935';

        // print(barcodeScanRes);

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3d8bef',
          'Cancelar',
          false,
          ScanMode.QR,
        );

        if (barcodeScanRes == '-1') return;

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        launchURL(context, nuevoScan);
      },
    );
  }
}
