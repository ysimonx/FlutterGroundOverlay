#!/bin/bash

# Script pour lancer l'application Flutter Tour Eiffel Batman Map

echo "==================================="
echo "Tour Eiffel Batman Map"
echo "==================================="
echo ""
echo "Sélectionnez la plateforme :"
echo "1) Android"
echo "2) iOS"
echo "3) Web (Chrome)"
echo "4) Build APK Android"
echo "5) Build iOS"
echo ""
read -p "Votre choix (1-5): " choice

case $choice in
  1)
    echo "Lancement sur Android..."
    flutter run -d android
    ;;
  2)
    echo "Lancement sur iOS..."
    flutter run -d ios
    ;;
  3)
    echo "Lancement sur Web (Chrome)..."
    flutter run -d chrome
    ;;
  4)
    echo "Build APK Android..."
    flutter build apk --release
    echo "APK créé dans : build/app/outputs/flutter-apk/app-release.apk"
    ;;
  5)
    echo "Build iOS..."
    flutter build ios --release
    echo "Build iOS créé dans : build/ios/iphoneos/"
    ;;
  *)
    echo "Choix invalide!"
    exit 1
    ;;
esac
