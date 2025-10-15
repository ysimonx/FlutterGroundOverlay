# Guide de la Rotation de la Carte

## Vue d'ensemble

L'application Tour Eiffel Batman Map supporte maintenant la **rotation complète de la carte**, vous permettant de changer l'orientation de la vue pour une meilleure exploration.

## Méthodes de rotation

### 1. Rotation tactile (Appareils tactiles)

Sur mobile ou tablette :
1. Placez deux doigts sur la carte
2. Faites un mouvement de rotation (comme pour tourner un volant)
3. La carte suivra le mouvement de vos doigts
4. Levez les doigts pour arrêter la rotation

**Astuce** : Cette méthode offre une rotation fluide et précise à n'importe quel angle.

### 2. Rotation par boutons

Utilisez les boutons de contrôle flottants sur le côté droit de l'écran :

- **Bouton Rotation Gauche** (⟲) : Fait tourner la carte de 45° dans le sens antihoraire
- **Bouton Rotation Droite** (⟳) : Fait tourner la carte de 45° dans le sens horaire

**Avantage** : Rotation précise par incréments de 45°, idéal pour aligner la carte avec les axes cardinaux.

### 3. Réinitialisation de la rotation

Le **bouton de recentrage** (📍) réinitialise à la fois :
- La position (retour à la Tour Eiffel)
- Le zoom (retour au niveau 16)
- La rotation (retour à 0°, nord en haut)

## Comportement de la rotation

### Angles de rotation
- La rotation est mesurée en degrés (0° à 360°)
- 0° = Nord en haut (orientation par défaut)
- 90° = Est en haut
- 180° = Sud en haut
- 270° = Ouest en haut

### Rotation continue
- La rotation n'a pas de limite : vous pouvez tourner indéfiniment
- Les angles s'accumulent (ex: 8 clics à droite = 360° = retour à 0°)

### Éléments affectés par la rotation
- **Tuiles de la carte** : Tournent avec la vue
- **Overlay Batman** : Tourne avec la carte
- **Marqueur Tour Eiffel** : L'icône reste droite mais tourne avec la carte
- **Contrôles** : Les boutons restent fixes

## Cas d'usage

### 1. Aligner avec une rue
Tournez la carte pour aligner une rue avec l'axe horizontal ou vertical de votre écran pour une meilleure lisibilité.

### 2. Suivre un itinéraire
Orientez la carte dans la direction de votre déplacement pour une navigation plus intuitive.

### 3. Vue artistique
Explorez la Tour Eiffel sous différents angles pour une perspective unique avec l'overlay Batman.

### 4. Présentation
Ajustez l'orientation pour des captures d'écran ou des présentations plus esthétiques.

## Combinaisons de gestes

### Sur mobile/tablette
- **Un doigt** : Déplacer la carte
- **Deux doigts (pinch)** : Zoomer/dézoomer
- **Deux doigts (rotation)** : Faire tourner la carte
- **Combinaison** : Vous pouvez zoomer ET tourner simultanément

### Sur desktop (Web)
- **Souris + glisser** : Déplacer la carte
- **Molette** : Zoomer/dézoomer
- **Boutons** : Utiliser les contrôles flottants pour rotation, zoom et recentrage

## Conseils et astuces

### Pour une rotation précise
1. Utilisez les boutons de rotation (45° par clic)
2. Effectuez 4 clics pour une rotation de 180°
3. Effectuez 8 clics pour revenir à l'orientation initiale

### Pour une rotation libre
1. Utilisez le geste tactile à deux doigts
2. Tournez lentement pour plus de précision
3. Tournez rapidement pour de grands changements d'angle

### Pour réorienter rapidement
- Appuyez sur le bouton de recentrage (📍) pour revenir instantanément au nord en haut

## Problèmes courants

### La rotation tactile ne fonctionne pas
**Solutions** :
- Vérifiez que vous utilisez bien deux doigts
- Assurez-vous que vos doigts sont suffisamment écartés
- Essayez sur un appareil tactile (ne fonctionne pas avec une souris)

### La carte tourne trop vite/lentement
**Solutions** :
- Ajustez la vitesse de votre geste
- Utilisez plutôt les boutons pour un contrôle précis
- La sensibilité est définie par flutter_map

### L'overlay Batman ne tourne pas correctement
**Note** : C'est le comportement attendu - l'overlay est lié géographiquement et tourne avec les tuiles de la carte.

## Implémentation technique

### Code Flutter
```dart
// Activation de tous les gestes interactifs
interactionOptions: const InteractionOptions(
  flags: InteractiveFlag.all,
),

// Rotation programmatique
_mapController.rotate(currentRotation + 45.0);
```

### Propriétés
- `initialRotation: 0.0` : Angle initial
- `InteractiveFlag.all` : Active tous les gestes (dont rotation)
- `_mapController.camera.rotation` : Angle actuel

## Compatibilité

| Plateforme | Rotation tactile | Rotation boutons |
|------------|------------------|------------------|
| Android    | ✅ Oui          | ✅ Oui           |
| iOS        | ✅ Oui          | ✅ Oui           |
| Web        | ❌ Non*         | ✅ Oui           |

*La rotation tactile sur Web nécessite un écran tactile

## Performance

La rotation est optimisée et n'impacte pas les performances :
- Rendu GPU accéléré
- Pas de rechargement des tuiles
- Animation fluide à 60 FPS

## Aller plus loin

Pour modifier le comportement de rotation, éditez [lib/main.dart](lib/main.dart) :
- Ligne 54 : `initialRotation` (angle initial)
- Lignes 116, 126 : Incrément de rotation (actuellement 45°)
- Ligne 55-57 : Options d'interaction

Vous pouvez changer l'incrément de rotation en modifiant la valeur 45.0 :
```dart
_mapController.rotate(currentRotation - 30.0); // Rotation de 30° au lieu de 45°
```

---

**Version** : 1.1.0
**Dernière mise à jour** : 2025-10-15
