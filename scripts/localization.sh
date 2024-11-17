#!/bin/bash

# lib/translations altında .g.dart dosyalarını otomatik oluşturur
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"

# locale_keys.g.dart dosyasını oluşturur
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys
