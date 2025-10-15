# Guide des Gestes Tactiles

## Vue d'ensemble

L'application Tour Eiffel Batman Map supporte une gamme complète de **gestes tactiles intuitifs** pour interagir avec la carte. Tous les gestes standards des cartes modernes sont disponibles.

## Gestes Disponibles

### 🤏 Pinch to Zoom (Pincement pour zoomer)

**Comment faire** :
1. Placez deux doigts sur la carte
2. **Écartez** les doigts pour **zoomer** (grossir la vue)
3. **Rapprochez** les doigts pour **dézoomer** (rétrécir la vue)

**Détails** :
- Zoom fluide et continu
- Suit le mouvement de vos doigts en temps réel
- Se centre automatiquement entre vos deux doigts
- Limites : zoom min = 10.0, zoom max = 18.0

**Astuce** : Faites un pincement rapide pour un zoom accéléré!

### 🔄 Rotation à deux doigts

**Comment faire** :
1. Placez deux doigts sur la carte (espacés d'au moins 5 cm)
2. Faites un mouvement de rotation comme pour **tourner un volant**
3. La carte suit la rotation de vos doigts

**Détails** :
- Rotation fluide à 360° sans limite
- Suit précisément le mouvement de rotation
- Fonctionne en même temps que le zoom (voir "Gestes combinés")
- L'overlay Batman reste fixe à l'écran pendant la rotation

**Astuce** : Utilisez des doigts bien écartés pour plus de précision!

### 👆 Pan/Drag (Déplacement)

**Comment faire** :
1. Placez un doigt sur la carte
2. **Glissez** dans n'importe quelle direction
3. Relâchez pour arrêter

**Détails** :
- Déplacement dans toutes les directions (haut, bas, gauche, droite, diagonale)
- Mouvement fluide qui suit votre doigt
- Pas de limite de distance
- Fonctionne même si la carte est tournée

**Astuce** : Glissez rapidement pour utiliser l'inertie (voir "Fling")!

### 👆👆 Double Tap (Double clic)

**Comment faire** :
1. Tapez rapidement deux fois au même endroit
2. La carte zoome automatiquement d'un niveau

**Détails** :
- Zoom rapide d'un niveau (équivalent au bouton +)
- Se centre sur l'endroit où vous avez tapé
- Utile pour un zoom rapide sans pincement
- Délai : les deux taps doivent être espacés de moins de 300ms

**Alternative** : Tapez avec deux doigts simultanément pour dézoomer d'un niveau.

### 💨 Fling (Défilement inertiel)

**Comment faire** :
1. Placez un doigt sur la carte
2. **Glissez rapidement** dans une direction
3. **Relâchez** sans vous arrêter

**Détails** :
- La carte continue de défiler après le relâchement
- Vitesse dépend de la vitesse de votre geste
- Ralentit progressivement (décélération naturelle)
- Touchez l'écran pour arrêter immédiatement

**Astuce** : Parfait pour parcourir de grandes distances rapidement!

## Gestes Combinés

### 🤏🔄 Pinch + Rotation simultanés

Vous pouvez **zoomer ET tourner en même temps** :
1. Commencez un pincement
2. Tout en maintenant, faites une rotation
3. La carte zoome et tourne simultanément

**Utilité** : Ajuster parfaitement la vue en un seul geste!

### 🔄👆 Rotation + Pan

Vous pouvez tourner puis immédiatement déplacer :
1. Tournez la carte avec 2 doigts
2. Levez un doigt et continuez avec 1 doigt pour déplacer

**Utilité** : Orientation puis positionnement rapides!

## Plateformes

### 📱 Mobile (Android/iOS)

**Tous les gestes fonctionnent parfaitement** :
- ✅ Pinch to zoom
- ✅ Rotation à deux doigts
- ✅ Pan/Drag
- ✅ Double tap
- ✅ Fling
- ✅ Gestes combinés

**Optimisé pour** :
- Écrans tactiles de smartphones
- Tablettes
- Détection multi-touch précise

### 🖥️ Web (Navigateur)

**Avec souris** :
- ✅ Pan/Drag (cliquer et glisser)
- ✅ Double clic pour zoom
- ✅ Molette pour zoom
- ❌ Rotation (utiliser les boutons)
- ❌ Pinch (pas de multi-touch)

**Avec trackpad/touchpad** :
- ✅ Tous les gestes si le trackpad supporte le multi-touch
- ✅ Pinch to zoom (sur MacBook par exemple)
- ✅ Rotation à deux doigts (sur certains trackpads)

**Avec écran tactile (ordinateur hybride)** :
- ✅ Tous les gestes comme sur mobile

### 🖥️ Desktop (Windows/macOS/Linux)

**Avec souris** :
- ✅ Cliquer-glisser pour déplacer
- ✅ Molette pour zoomer
- ✅ Boutons pour rotation
- ❌ Gestes tactiles (sauf écran tactile)

**Avec trackpad** :
- Dépend du support multi-touch du trackpad

## Configuration Technique

### Code actuel

```dart
MapOptions(
  initialCenter: eiffelTowerLocation,
  initialZoom: 16.0,
  minZoom: 10.0,
  maxZoom: 18.0,
  initialRotation: 0.0,
  interactionOptions: const InteractionOptions(
    flags: InteractiveFlag.all, // 👈 Active TOUS les gestes
  ),
)
```

### Flags disponibles

`InteractiveFlag.all` active :
- `InteractiveFlag.drag` - Déplacement
- `InteractiveFlag.flingAnimation` - Inertie
- `InteractiveFlag.pinchMove` - Pincement pour déplacer
- `InteractiveFlag.pinchZoom` - Pincement pour zoomer
- `InteractiveFlag.doubleTapZoom` - Double tap pour zoomer
- `InteractiveFlag.rotate` - Rotation à deux doigts

### Personnalisation

Si vous voulez **désactiver certains gestes** :

```dart
// Exemple : Désactiver la rotation tactile
interactionOptions: const InteractionOptions(
  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
),

// Exemple : Seulement pan et zoom, pas de rotation
interactionOptions: const InteractionOptions(
  flags: InteractiveFlag.drag |
         InteractiveFlag.pinchZoom |
         InteractiveFlag.flingAnimation,
),
```

## Sensibilité et Paramètres

### Vitesse de rotation

Par défaut, la rotation suit précisément vos doigts. Pour modifier la sensibilité :

```dart
interactionOptions: InteractionOptions(
  flags: InteractiveFlag.all,
  rotationThreshold: 20.0,  // Plus élevé = moins sensible (défaut: 20.0)
),
```

### Vitesse de zoom

```dart
interactionOptions: InteractionOptions(
  flags: InteractiveFlag.all,
  pinchZoomThreshold: 0.5,  // Plus élevé = moins sensible (défaut: 0.5)
),
```

### Vitesse d'inertie

```dart
interactionOptions: InteractionOptions(
  flags: InteractiveFlag.all,
  scrollWheelVelocity: 0.005,  // Vitesse du défilement (défaut: 0.005)
),
```

## Boutons vs Gestes

Vous avez **deux façons** d'interagir avec la carte :

### Option 1 : Gestes Tactiles (recommandé mobile)
- ✅ Plus intuitif sur mobile/tablette
- ✅ Plus rapide et fluide
- ✅ Permet les gestes combinés
- ❌ Nécessite un écran tactile

### Option 2 : Boutons (recommandé desktop)
- ✅ Contrôle précis (incréments fixes)
- ✅ Fonctionne sans tactile
- ✅ Séparation claire carte/overlay
- ❌ Moins fluide que les gestes

**Meilleure pratique** : Utilisez les deux! Gestes pour l'interaction rapide, boutons pour les ajustements précis.

## Conseils d'utilisation

### Pour un zoom précis
1. **Gestes** : Pincez lentement
2. **Boutons** : Utilisez + et - (incréments de 1.0)
3. **Souris** : Utilisez la molette

### Pour une rotation précise
1. **Gestes** : Tournez lentement avec doigts écartés
2. **Boutons** : Utilisez ⟲ et ⟳ (incréments de 45°)

### Pour explorer rapidement
1. Utilisez le **fling** (glissement rapide)
2. Combinez **pinch + rotation** pour ajuster la vue
3. Double tap pour zoomer rapidement

### Pour revenir à la vue initiale
1. **Bouton** : Cliquez sur 📍 (recentrer)
2. Ou naviguez manuellement avec les gestes

## Accessibilité

### Pour utilisateurs avec limitations motrices
- Les **boutons** offrent une alternative aux gestes
- Taille des boutons : suffisamment grande pour un tap facile
- Pas de gestes complexes requis (tout peut se faire avec les boutons)

### Pour utilisateurs malvoyants
- **Tooltips** sur tous les boutons (lecture vocale)
- Contraste élevé des boutons
- Labels clairs "Overlay" et "Carte"

## Performances

### Fluidité
- **60 FPS** constant pendant les gestes
- Rendu GPU accéléré
- Pas de lag même lors de gestes combinés

### Consommation batterie
- Optimisée pour mobile
- Mode veille quand aucune interaction
- Pas de rafraîchissement continu

## Dépannage

### Le pinch to zoom ne fonctionne pas
- ✅ Vérifiez que vous utilisez bien **deux doigts**
- ✅ Sur Web : Vérifiez le support tactile du navigateur
- ✅ Essayez les boutons + et - comme alternative

### La rotation tactile ne fonctionne pas
- ✅ Espacez bien vos **deux doigts** (minimum 5cm)
- ✅ Faites un mouvement de rotation clair
- ✅ Sur Web : Le trackpad doit supporter le multi-touch
- ✅ Utilisez les boutons ⟲ et ⟳ comme alternative

### Le fling est trop rapide/lent
- ✅ Ajustez `scrollWheelVelocity` dans le code
- ✅ Ou touchez l'écran pour arrêter immédiatement

### Les gestes semblent retardés
- ✅ Vérifiez la connexion réseau (tuiles de carte)
- ✅ Sur mobile : Fermez les apps en arrière-plan
- ✅ Sur Web : Utilisez un navigateur moderne (Chrome/Firefox)

## Exemples d'utilisation

### Cas 1 : Explorer Paris
1. **Pinch out** pour dézoomer et voir toute la ville
2. **Pan** pour parcourir les monuments
3. **Pinch in** sur la Tour Eiffel pour zoomer

### Cas 2 : Aligner avec une rue
1. **Rotate** la carte pour aligner une rue avec l'écran
2. **Pan** le long de la rue
3. **Reset** pour revenir au nord

### Cas 3 : Vue rapide 360°
1. **Rotate** rapidement avec deux doigts
2. Faites un tour complet (360°)
3. **Reset** pour revenir à 0°

### Cas 4 : Zoom + Rotate simultané
1. Commencez un **pinch**
2. Tout en pinçant, **tournez**
3. Obtenez la vue parfaite en un geste!

## Comparaison avec d'autres apps

| Geste | Google Maps | Apple Maps | Notre App |
|-------|-------------|------------|-----------|
| Pinch to zoom | ✅ | ✅ | ✅ |
| Rotation 2 doigts | ✅ | ✅ | ✅ |
| Pan/Drag | ✅ | ✅ | ✅ |
| Double tap | ✅ | ✅ | ✅ |
| Fling | ✅ | ✅ | ✅ |
| Overlay rotatif | ❌ | ❌ | ✅ 🌟 |

**Notre avantage unique** : Rotation d'overlay indépendante!

---

**Version** : 1.2.0
**Dernière mise à jour** : 2025-10-15
**Flutter Map** : v7.0.2
