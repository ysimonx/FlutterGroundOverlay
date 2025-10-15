# Changelog

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

## [1.2.0] - 2025-10-15

### Ajouté
- **Rotation d'overlay indépendante** ⭐ NOUVEAU
  - L'overlay peut maintenant tourner indépendamment de la carte
  - 3 boutons de contrôle dédiés pour l'overlay (rotation gauche, droite, réinitialisation)
  - Incréments de rotation de 15° pour l'overlay
  - Interface séparée : colonne gauche (overlay) et colonne droite (carte)
  - Labels "Overlay" et "Carte" pour distinguer les contrôles
- Guide complet de rotation d'overlay (OVERLAY_ROTATION_GUIDE.md)
- Support pour images personnalisées en overlay

### Modifié
- Refonte de l'interface utilisateur avec deux colonnes de contrôles
- L'overlay utilise maintenant un `Marker` rotatif au lieu d'`OverlayImageLayer`
- Meilleure organisation des boutons flottants
- L'overlay reste fixe à l'écran lors de la rotation de la carte

### Technique
- Implémentation avec `Transform.rotate()` pour rotation fluide
- Utilisation de `rotate: true` sur le Marker pour orientation fixe
- Conversion automatique degrés → radians

## [1.1.0] - 2025-10-15

### Ajouté
- **Rotation de la carte** : Support complet de la rotation
  - Rotation tactile avec geste à deux doigts
  - Boutons de rotation gauche/droite (45° par clic)
  - Réinitialisation de la rotation avec le bouton de recentrage
- 5 boutons de contrôle flottants (recentrer, rotation gauche, rotation droite, zoom +, zoom -)

### Modifié
- Amélioration de l'interface utilisateur avec plus de contrôles
- Mise à jour du bouton de recentrage pour inclure la réinitialisation de rotation
- Documentation mise à jour avec instructions de rotation

## [1.0.0] - 2025-10-15

### Ajouté
- Application Flutter multi-plateformes (Android, iOS, Web)
- Carte interactive OpenStreetMap
- Vue centrée sur la Tour Eiffel à Paris (48.858370, 2.294481)
- Overlay personnalisé avec logo Batman au-dessus de la Tour Eiffel
- Marqueur rouge sur la Tour Eiffel
- Contrôles de zoom interactifs (+/-)
- Bouton de recentrage rapide sur la Tour Eiffel
- Navigation par glissement tactile sur la carte
- Script de lancement rapide (`run.sh`)
- Documentation complète (README.md, GUIDE.md)
- Support Web optimisé
- Permissions Android configurées (INTERNET, ACCESS_NETWORK_STATE)
- Configuration iOS complète

### Dépendances
- flutter_map: ^7.0.2
- latlong2: ^0.9.1

### Configuration
- Zoom initial: 16.0
- Zoom min: 10.0
- Zoom max: 18.0
- Opacité de l'overlay: 0.7 (70%)
- Taille du marqueur: 40x40 pixels

### Assets
- Logo Batman en PNG (200x200 pixels)
- Logo Batman en SVG (fichier vectoriel)

### Fichiers de documentation
- README.md: Documentation utilisateur
- GUIDE.md: Guide technique détaillé
- PROJECT_INFO.txt: Informations récapitulatives
- CHANGELOG.md: Journal des modifications

## Notes de version

### Version 1.0.0
Première version stable de l'application avec support complet pour Android, iOS et Web.

L'application permet de visualiser la Tour Eiffel sur une carte OpenStreetMap avec un overlay personnalisé du logo Batman. Les utilisateurs peuvent zoomer, dézoomer et naviguer sur la carte de manière fluide.

### Fonctionnalités futures envisagées
- [ ] Mode sombre/clair
- [ ] Sélection de différents overlays
- [ ] Marqueurs supplémentaires sur d'autres monuments parisiens
- [ ] Itinéraire vers la Tour Eiffel
- [ ] Informations détaillées sur la Tour Eiffel
- [ ] Partage de la vue actuelle
- [ ] Cache hors ligne amélioré
- [ ] Animations de l'overlay
- [ ] Support de plusieurs langues
- [ ] Thèmes de cartes alternatifs (satellite, terrain, etc.)
