#!/bin/bash

# Funkcja wyświetlająca pomoc
usage() {
    echo "Użycie: $0 {-r|-l} input_file output_file"
    echo "  -r    Obróć wideo o 90 stopni w prawo (clockwise)"
    echo "  -l    Obróć wideo o 90 stopni w lewo (counter-clockwise)"
    exit 1
}

# Sprawdzenie liczby argumentów
if [ "$#" -ne 3 ]; then
    echo "Błąd: Nieprawidłowa liczba argumentów."
    usage
fi

# Przypisanie argumentów do zmiennych
direction="$1"
input_file="$2"
output_file="$3"

# Sprawdzenie czy ffmpeg jest zainstalowany
if ! command -v ffmpeg &> /dev/null
then
    echo "Błąd: ffmpeg nie jest zainstalowany. Zainstaluj ffmpeg i spróbuj ponownie."
    exit 1
fi

# Ustawienie filtra transpozycji na podstawie kierunku obrotu
case "$direction" in
    -r)
        transpose=1  # Obrót o 90 stopni w prawo
        ;;
    -l)
        transpose=2  # Obrót o 90 stopni w lewo
        ;;
    *)
        echo "Błąd: Nieznany argument '$direction'."
        usage
        ;;
esac

# Sprawdzenie czy plik wejściowy istnieje
if [ ! -f "$input_file" ]; then
    echo "Błąd: Plik wejściowy '$input_file' nie istnieje."
    exit 1
fi

# Wykonanie obrotu za pomocą ffmpeg
ffmpeg -i "$input_file" -vf "transpose=$transpose" -c:a copy "$output_file"

# Sprawdzenie czy ffmpeg zakończył się sukcesem
if [ $? -eq 0 ]; then
    echo "Obrót wideo zakończony sukcesem. Zapisano jako '$output_file'."
else
    echo "Błąd: Obrót wideo nie powiódł się."
    exit 1
fi
