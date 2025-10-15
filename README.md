# Tour Eiffel Batman Map

Application Flutter qui affiche une carte OpenStreetMap centrée sur la Tour Eiffel à Paris avec un overlay du logo Batman.

## Fonctionnalités

- Carte interactive OpenStreetMap
- Vue centrée sur la Tour Eiffel (48.858370, 2.294481)
- Overlay personnalisé avec le logo Batman au-dessus de la Tour Eiffel
- Marqueur rouge sur la Tour Eiffel
- **Gestes tactiles complets** 🤏 :
  - Pinch to zoom (pincez pour zoomer/dézoomer)
  - Rotation à deux doigts
  - Pan/Drag (glissement pour déplacer)
  - Double tap pour zoom rapide
  - Fling (défilement inertiel)
- **Rotation de la carte** : Rotation tactile ou par boutons (45° par clic)
- **Rotation d'overlay indépendante** ⭐ : L'overlay peut tourner séparément (15° par clic)
- Contrôles de zoom (+/-)
- Interface à deux colonnes : contrôles overlay (gauche) et carte (droite)
- Bouton de recentrage et réinitialisation des rotations
- Support multi-plateformes : Android, iOS et Web
- Support d'images personnalisées en overlay

## Prérequis

- Flutter SDK (version 3.8.1 ou supérieure)
- Dart SDK
- Android Studio / Xcode pour le développement mobile

## Dépendances

- `flutter_map: ^7.0.2` - Bibliothèque de cartographie pour Flutter
- `latlong2: ^0.9.1` - Gestion des coordonnées géographiques

## Installation

1. Clonez ou naviguez vers le répertoire du projet
2. Installez les dépendances :
   ```bash
   flutter pub get
   ```

## Exécution

### Android
```bash
flutter run -d android
```

### iOS
```bash
flutter run -d ios
```

### Web
```bash
flutter run -d chrome
```

### Script de lancement rapide
Un script `run.sh` est fourni pour faciliter le lancement :
```bash
./run.sh
```
Le script vous proposera de choisir la plateforme cible.

## Structure du projet

```
eiffel_tower_map/
├── lib/
│   └── main.dart              # Code principal de l'application
├── assets/
│   └── images/
│       ├── batman_logo.png    # Logo Batman en PNG
│       └── batman_logo.svg    # Logo Batman en SVG
├── android/                   # Configuration Android
├── ios/                       # Configuration iOS
└── pubspec.yaml              # Dépendances du projet
```

## Permissions

### Android
L'application nécessite les permissions suivantes (déjà configurées) :
- `INTERNET` - Pour télécharger les tuiles de la carte
- `ACCESS_NETWORK_STATE` - Pour vérifier la connectivité réseau

### iOS
Les permissions sont automatiquement gérées par Flutter.

## Utilisation

### Gestes tactiles 🤏

L'application supporte tous les gestes tactiles standards :
- **Pinch to zoom** : Pincez avec deux doigts pour zoomer/dézoomer
- **Rotation** : Tournez avec deux doigts pour faire pivoter la carte
- **Pan** : Glissez avec un doigt pour déplacer la carte
- **Double tap** : Tapez deux fois pour zoomer rapidement
- **Fling** : Glissez rapidement pour un défilement inertiel

📖 **Consultez [GESTURES_GUIDE.md](eiffel_tower_map/GESTURES_GUIDE.md) pour le guide complet des gestes!**

### Contrôles de base (boutons)
- **Navigation** : Faites glisser la carte avec votre doigt pour explorer
- **Zoom** : Utilisez les boutons + et - (colonne droite) pour zoomer/dézoomer

### Rotation de la carte (colonne droite "Carte")
- **Tactile** : Utilisez deux doigts et faites un mouvement de rotation sur la carte
- **Boutons** : Utilisez les boutons de rotation gauche/droite (45° par clic)
- **Recentrer** : Appuyez sur le bouton avec l'icône de localisation pour revenir à la vue initiale

### Rotation de l'overlay ⭐ NOUVEAU (colonne gauche "Overlay")
- **Rotation gauche** : Cliquez sur ⟲ pour tourner l'overlay de 15° antihoraire
- **Rotation droite** : Cliquez sur ⟳ pour tourner l'overlay de 15° horaire
- **Réinitialiser** : Cliquez sur ↻ pour remettre l'overlay à 0°

**Note** : L'overlay et la carte peuvent tourner indépendamment! Consultez [OVERLAY_ROTATION_GUIDE.md](OVERLAY_ROTATION_GUIDE.md) pour plus de détails.

## Personnalisation

Pour modifier l'overlay :
1. Remplacez l'image dans `assets/images/batman_logo.png`
2. Ajustez l'opacité dans `main.dart` (ligne 73) : `opacity: 0.7`
3. Modifiez les limites de l'overlay dans `main.dart` (lignes 69-70)

Pour changer la position :
1. Modifiez `eiffelTowerLocation` dans `main.dart` (ligne 35)

## Notes

- Les tuiles de la carte proviennent de OpenStreetMap
- L'overlay Batman est semi-transparent (70% d'opacité)
- L'application fonctionne hors ligne pour les zones déjà visitées (cache)

## Licence

Ce projet est créé à des fins éducatives et de démonstration.
