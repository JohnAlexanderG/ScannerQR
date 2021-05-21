import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Providers
import 'package:scannerqr/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el _selectedMenuOpt del UIProvider
    final _uiProvider = Provider.of<UIProvider>(context);
    //
    final currentIndex = _uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      onTap: (int indice) {
        // _uiProvider.setSelectedMenuOpt es un seter y recibe
        // el parametro como propieda, no es un método-.
        _uiProvider.setSelectedMenuOpt = indice;
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones',
        ),
      ],
    );
  }
}
