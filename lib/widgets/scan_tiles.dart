import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scannerqr/providers/scan_list_provider.dart';
import 'package:scannerqr/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final tipo;
  const ScanTiles({@required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScanById(scans[i].id);
        },
        child: ListTile(
          leading: Icon(
            this.tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].valor),
          subtitle: Text('ID: ${scans[i].id.toString()}'),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.green,
          ),
          // onTap: () => print(scans[i].id),
          onTap: () => launchURL(context, scans[i]),
        ),
      ),
    );
  }
}
