# Guide de l'application Tour Eiffel Batman Map

## Présentation

Cette application Flutter affiche une carte OpenStreetMap interactive centrée sur la célèbre Tour Eiffel à Paris, avec un overlay personnalisé représentant le logo de Batman positionné au-dessus du monument.

## Architecture de l'application

### Fichiers principaux

- **lib/main.dart** : Code source principal de l'application
- **assets/images/** : Ressources graphiques (logo Batman)
- **pubspec.yaml** : Configuration et dépendances du projet
- **run.sh** : Script de lancement rapide

### Composants clés

#### 1. MyApp (Widget principal)
- Configure le MaterialApp
- Définit le thème de l'application
- Pointe vers l'écran de carte (MapScreen)

#### 2. MapScreen (Écran de la carte)
- Gère l'affichage de la carte OpenStreetMap
- Coordonnées de la Tour Eiffel : `48.858370, 2.294481`
- Zoom initial : 16.0
- Zoom min/max : 10.0 - 18.0

#### 3. Layers (Couches de la carte)

**TileLayer** : Affiche les tuiles OpenStreetMap
- URL template : `https://tile.openstreetmap.org/{z}/{x}/{y}.png`
- User agent : `com.example.eiffel_tower_map`

**OverlayImageLayer** : Affiche le logo Batman
- Bounds (limites géographiques) :
  - Sud-Ouest : `48.857370, 2.293481`
  - Nord-Est : `48.859370, 2.295481`
- Opacité : 0.7 (70%)
- Image : `assets/images/batman_logo.png`

**MarkerLayer** : Marqueur rouge sur la Tour Eiffel
- Position : Exactement sur les coordonnées de la Tour Eiffel
- Icône : `Icons.location_pin` (rouge)
- Taille : 40x40 pixels

#### 4. Contrôles de navigation

Trois boutons flottants :
1. **Recentrage** : Retourne à la vue initiale de la Tour Eiffel (zoom 16)
2. **Zoom +** : Augmente le niveau de zoom de 1
3. **Zoom -** : Diminue le niveau de zoom de 1

## Fonctionnement technique

### Gestion de la carte
- Utilise `MapController` pour contrôler programmatiquement la carte
- Méthode `move()` pour déplacer et zoomer la carte
- Accès à la caméra via `_mapController.camera.zoom`

### Gestion des ressources
- Les images sont chargées depuis le dossier `assets/images/`
- Déclaration dans `pubspec.yaml` sous `flutter > assets`
- Chargement via `AssetImage()`

### Support multi-plateformes

**Android** :
- Permissions Internet et Network State configurées dans `AndroidManifest.xml`
- Build avec : `flutter build apk --release`

**iOS** :
- Configuration automatique des permissions
- Build avec : `flutter build ios --release`

**Web** :
- Support complet du navigateur
- Lancement avec : `flutter run -d chrome`
- Recommandation : Plugin `flutter_map_cancellable_tile_provider` pour de meilleures performances

## Personnalisation avancée

### Changer la position de l'overlay

Modifiez les coordonnées dans `main.dart` :
```dart
bounds: LatLngBounds(
  const LatLng(48.857370, 2.293481), // Sud-Ouest
  const LatLng(48.859370, 2.295481), // Nord-Est
),
```

### Modifier l'opacité de l'overlay

Ajustez la valeur `opacity` (0.0 à 1.0) :
```dart
opacity: 0.7, // 70% opaque
```

### Changer le centre de la carte

Modifiez `eiffelTowerLocation` :
```dart
static const LatLng eiffelTowerLocation = LatLng(latitude, longitude);
```

### Personnaliser le marqueur

Remplacez l'icône dans le `Marker` :
```dart
child: const Icon(
  Icons.star, // Par exemple
  size: 50,
  color: Colors.blue,
),
```

### Changer le style de carte

Modifiez l'`urlTemplate` pour utiliser d'autres fournisseurs de tuiles :
```dart
// Exemple avec OpenTopoMap
urlTemplate: 'https://tile.opentopomap.org/{z}/{x}/{y}.png',
```

## Dépendances principales

### flutter_map (^7.0.2)
Bibliothèque de cartographie interactive pour Flutter
- Documentation : https://pub.dev/packages/flutter_map
- GitHub : https://github.com/fleaflet/flutter_map

### latlong2 (^0.9.1)
Gestion des coordonnées géographiques
- Conversion latitude/longitude
- Calculs de distance
- Documentation : https://pub.dev/packages/latlong2

## Commandes utiles

### Développement
```bash
# Lancer en mode debug
flutter run

# Lancer sur un device spécifique
flutter run -d <device_id>

# Lister les devices disponibles
flutter devices

# Hot reload (pendant l'exécution)
# Appuyez sur 'r' dans le terminal

# Hot restart
# Appuyez sur 'R' dans le terminal
```

### Build
```bash
# Build Android APK
flutter build apk --release

# Build Android App Bundle
flutter build appbundle --release

# Build iOS
flutter build ios --release

# Build Web
flutter build web --release
```

### Maintenance
```bash
# Nettoyer le projet
flutter clean

# Mettre à jour les dépendances
flutter pub upgrade

# Analyser le code
flutter analyze

# Formater le code
flutter format lib/
```

## Débogage

### Problèmes courants

**1. Carte ne s'affiche pas**
- Vérifier la connexion Internet
- Vérifier les permissions Android (AndroidManifest.xml)
- Consulter les logs : `flutter logs`

**2. Image Batman ne s'affiche pas**
- Vérifier que l'image existe dans `assets/images/`
- Vérifier la déclaration dans `pubspec.yaml`
- Lancer `flutter clean` puis `flutter pub get`

**3. Erreurs de build**
- Lancer `flutter clean`
- Supprimer les dossiers `build/` et `.dart_tool/`
- Relancer `flutter pub get`

### DevTools

Accéder aux DevTools Flutter pendant l'exécution :
- L'URL s'affiche dans le terminal après le lancement
- Permet d'inspecter les widgets, performances, réseau, etc.

## Performance

### Optimisations recommandées

1. **Web** : Installer `flutter_map_cancellable_tile_provider`
2. **Mobile** : Activer le mode release pour les builds finaux
3. **Cache** : Les tuiles sont automatiquement mises en cache

### Métriques

- Temps de démarrage : ~2-3 secondes
- Mémoire utilisée : ~50-100 MB (varie selon la plateforme)
- Taille APK : ~20-30 MB (release)

## Licence et crédits

- Flutter : Google (BSD License)
- OpenStreetMap : Contributeurs OSM (ODbL)
- flutter_map : Communauté Flutter
- Logo Batman : Créé pour cette démo (usage éducatif)

## Support et contribution

Pour toute question ou amélioration :
1. Consultez la documentation Flutter : https://flutter.dev
2. Documentation flutter_map : https://docs.fleaflet.dev
3. OpenStreetMap : https://www.openstreetmap.org
