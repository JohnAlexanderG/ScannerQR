import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scannerqr/models/scan_model.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if (scan.tipo == 'http') {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
