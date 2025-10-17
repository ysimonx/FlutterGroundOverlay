import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour Eiffel Batman Map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Coordonnées de la Tour Eiffel
  static const LatLng eiffelTowerLocation = LatLng(48.858370, 2.294481);

  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Tour Eiffel - Batman Overlay'),
        centerTitle: true,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: eiffelTowerLocation,
          initialZoom: 18.0,
          minZoom: 10.0,
          maxZoom: 22.0,
          initialRotation: 0.0,
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag
                .all, // Active tous les gestes (rotation incluse)
          ),
        ),
        children: [
          // Carte OpenStreetMap
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.eiffel_tower_map',
            maxZoom: 22,
          ),

          // Overlay du logo Batman sur la Tour Eiffel (s'adapte au zoom)
          OverlayImageLayer(
            overlayImages: [
              OverlayImage(
                bounds: LatLngBounds(
                  const LatLng(48.857370, 2.293481), // Sud-Ouest
                  const LatLng(48.859370, 2.295481), // Nord-Est
                ),
                opacity: 0.7,
                imageProvider: const AssetImage('assets/images/batman_logo.png'),
              ),
            ],
          ),

          // Marqueur Google Maps style au centre du logo Batman
          // Ne tourne pas et garde une taille fixe
          MarkerLayer(
            markers: [
              Marker(
                point: eiffelTowerLocation,
                width: 50,
                height: 60,
                rotate: true, // Reste toujours orienté vers le haut
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Ombre du marqueur
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 30,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    // Pin principal
                    Positioned(
                      bottom: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Cercle supérieur
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.circle,
                                size: 8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Pointe du pin
                          CustomPaint(
                            size: const Size(12, 10),
                            painter: PinPointerPainter(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Carte',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(height: 5),
              FloatingActionButton(
                heroTag: 'reset',
                onPressed: () {
                  _mapController.rotate(0.0);
                  _mapController.move(eiffelTowerLocation, 18.0);
                },
                tooltip: 'Recentrer et réinitialiser la rotation',
                child: const Icon(Icons.my_location),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: 'rotate_left',
                onPressed: () {
                  final currentRotation = _mapController.camera.rotation;
                  _mapController.rotate(currentRotation - 45.0);
                },
                tooltip: 'Rotation carte gauche (45°)',
                child: const Icon(Icons.rotate_left),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: 'rotate_right',
                onPressed: () {
                  final currentRotation = _mapController.camera.rotation;
                  _mapController.rotate(currentRotation + 45.0);
                },
                tooltip: 'Rotation carte droite (45°)',
                child: const Icon(Icons.rotate_right),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: 'zoom_in',
                onPressed: () {
                  final currentZoom = _mapController.camera.zoom;
                  _mapController.move(
                    _mapController.camera.center,
                    currentZoom + 1,
                  );
                },
                tooltip: 'Zoom +',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: 'zoom_out',
                onPressed: () {
                  final currentZoom = _mapController.camera.zoom;
                  _mapController.move(
                    _mapController.camera.center,
                    currentZoom - 1,
                  );
                },
                tooltip: 'Zoom -',
                child: const Icon(Icons.remove),
              ),
            ],
      ),
    );
  }
}

// Custom painter pour la pointe du marqueur (style Google Maps)
class PinPointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

    final path = ui.Path();
    // Dessine un triangle pointant vers le bas
    path.moveTo(size.width / 2, size.height); // Pointe en bas
    path.lineTo(0, 0); // Coin gauche
    path.lineTo(size.width, 0); // Coin droit
    path.close();

    // Dessine l'ombre
    canvas.save();
    canvas.translate(1, 1);
    canvas.drawPath(path, shadowPaint);
    canvas.restore();

    // Dessine la pointe
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
