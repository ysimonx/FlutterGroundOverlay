# Démarrage Rapide

## En 3 étapes

### 1. Installation des dépendances
```bash
cd eiffel_tower_map
flutter pub get
```

### 2. Lancement de l'application

#### Option A : Script interactif (recommandé)
```bash
./run.sh
```
Puis choisissez votre plateforme (1-5)

#### Option B : Commande directe

**Web (le plus rapide pour tester)**
```bash
flutter run -d chrome
```

**Android**
```bash
flutter run -d android
```

**iOS**
```bash
flutter run -d ios
```

### 3. Utilisation

Une fois l'application lancée :
- La carte s'ouvre automatiquement sur la Tour Eiffel
- Le logo Batman apparaît au-dessus du monument
- Utilisez les boutons + et - pour zoomer
- Appuyez sur l'icône de localisation pour recentrer
- Faites glisser la carte pour naviguer

## Test rapide Web

Le moyen le plus rapide pour tester l'application :

```bash
cd eiffel_tower_map
flutter pub get
flutter run -d chrome
```

L'application s'ouvrira dans Chrome en quelques secondes.

## Résolution de problèmes

**Problème** : `flutter: command not found`
**Solution** : Installez Flutter depuis https://flutter.dev/docs/get-started/install

**Problème** : `No devices found`
**Solution** :
- Web : Installez Chrome
- Android : Connectez un appareil ou lancez un émulateur
- iOS : Utilisez un Mac avec Xcode installé

**Problème** : Erreur de dépendances
**Solution** :
```bash
flutter clean
flutter pub get
```

## Que se passe-t-il ?

1. **Carte OpenStreetMap** : Chargement des tuiles depuis les serveurs OSM
2. **Tour Eiffel** : Coordonnées GPS 48.858370, 2.294481
3. **Logo Batman** : Overlay semi-transparent (70% opacité) positionné sur la tour
4. **Marqueur** : Pin rouge indiquant l'emplacement exact

## Prochaines étapes

- Consultez [README.md](README.md) pour plus de détails
- Lisez [GUIDE.md](GUIDE.md) pour la documentation technique
- Personnalisez l'overlay dans `lib/main.dart`

## Support

- Documentation Flutter : https://flutter.dev
- Documentation flutter_map : https://docs.fleaflet.dev
- Issues : Consultez les logs avec `flutter logs`

Bon développement!
