#!/bin/bash

# Inicjalizacja zmiennych
output_file="output.mp4"
input_files=()
has_audio=false

# Parsowanie argumentów
while [[ $# -gt 0 ]]; do
    case $1 in
        -i)
            shift
            while [[ $# -gt 0 && $1 != -* ]]; do
                input_files+=("$1")
                shift
            done
            ;;
        -o)
            shift
            if [[ $# -gt 0 ]]; then
                output_file="$1"
                shift
            else
                echo "Błąd: brak nazwy pliku wyjściowego po opcji -o"
                exit 1
            fi
            ;;
        *)
            echo "Nieznana opcja $1"
            exit 1
            ;;
    esac
done

# Sprawdzenie czy są pliki wejściowe
if [[ ${#input_files[@]} -eq 0 ]]; then
    echo "Błąd: brak plików wejściowych. Użyj opcji -i, aby podać pliki do połączenia."
    exit 1
fi

# Sprawdzenie czy pliki wejściowe mają audio
for input_file in "${input_files[@]}"; do
    if ffprobe -i "$input_file" -show_streams 2>/dev/null | grep -q "^codec_type=audio$"; then
        has_audio=true
        break
    fi
done

# Budowanie polecenia ffmpeg
ffmpeg_command="ffmpeg "

# Dodawanie plików wejściowych
for input_file in "${input_files[@]}"; do
    ffmpeg_command+="-i \"$input_file\" "
done

# Liczba plików
num_files=${#input_files[@]}

# Budowanie filter_complex
filter_complex=""
if $has_audio; then
    for ((i=0; i<$num_files; i++)); do
        filter_complex+="[$i:v:0][$i:a:0]"
    done
    filter_complex+="concat=n=$num_files:v=1:a=1 [v][a]"
    # Dodawanie opcji do polecenia ffmpeg
    ffmpeg_command+="-filter_complex \"$filter_complex\" -map \"[v]\" -map \"[a]\" \"$output_file\""
else
    for ((i=0; i<$num_files; i++)); do
        filter_complex+="[$i:v:0]"
    done
    filter_complex+="concat=n=$num_files:v=1 [v]"
    # Dodawanie opcji do polecenia ffmpeg
    ffmpeg_command+="-filter_complex \"$filter_complex\" -map \"[v]\" \"$output_file\""
fi

# Wykonanie polecenia
eval $ffmpeg_command

