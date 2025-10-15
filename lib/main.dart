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

  // Angle de rotation de l'overlay (indépendant de la carte)
  double _overlayRotation = 0.0;

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
          initialZoom: 16.0,
          minZoom: 10.0,
          maxZoom: 18.0,
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
            maxZoom: 19,
          ),

          // Marqueur sur la Tour Eiffel
          MarkerLayer(
            markers: [
              Marker(
                point: eiffelTowerLocation,
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.location_pin,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            ],
          ),

          // Overlay rotatif du logo Batman sur la Tour Eiffel
          MarkerLayer(
            markers: [
              Marker(
                point: eiffelTowerLocation,
                width: 200,
                height: 200,
                rotate: true, // Garde l'orientation fixe par rapport à l'écran
                child: Transform.rotate(
                  angle: _overlayRotation * (3.14159 / 180), // Conversion en radians
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/batman_logo.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Contrôles de l'overlay à gauche
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Overlay',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(height: 5),
              FloatingActionButton.small(
                heroTag: 'overlay_rotate_left',
                onPressed: () {
                  setState(() {
                    _overlayRotation -= 15.0;
                  });
                },
                tooltip: 'Rotation overlay gauche (15°)',
                child: const Icon(Icons.rotate_left, size: 20),
              ),
              const SizedBox(height: 5),
              FloatingActionButton.small(
                heroTag: 'overlay_rotate_right',
                onPressed: () {
                  setState(() {
                    _overlayRotation += 15.0;
                  });
                },
                tooltip: 'Rotation overlay droite (15°)',
                child: const Icon(Icons.rotate_right, size: 20),
              ),
              const SizedBox(height: 5),
              FloatingActionButton.small(
                heroTag: 'overlay_reset',
                onPressed: () {
                  setState(() {
                    _overlayRotation = 0.0;
                  });
                },
                tooltip: 'Réinitialiser rotation overlay',
                child: const Icon(Icons.refresh, size: 20),
              ),
            ],
          ),
          const SizedBox(width: 10),
          // Contrôles de la carte à droite
          Column(
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
                  _mapController.move(eiffelTowerLocation, 16.0);
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
        ],
      ),
    );
  }
}
