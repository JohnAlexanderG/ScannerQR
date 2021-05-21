# scannerqr

Flutter App - Lector de codigos QR.

![Alt Text](./assets/ScannerQR.gif)

### Generador de Codigos QR
https://www.qrcode.es/es/generador-qr-code/


### formato para mapas - text

```
    geo:latitude,longitude
    geo:4.4930688,-74.115988
```
### formato para website - html

```
    https://www.johnalexanderg.dev/
```

### Dependencias

* path_provider: ^2.0.1 
(nos sirve para compartir nuestro estado con otros widgets)
* sqflite: ^2.0.0+3
(base de datos local en el dispositivo)
* url_launcher: ^6.0.4
(abre en una nueva ventana un sitio web)
* google_maps_flutter: ^2.0.5
(renderiza el mapa de google maps en nuestra aplicación).