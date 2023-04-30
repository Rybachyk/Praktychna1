#!/bin/bash

# URL веб-сервера, який перевіряється
URL="http://example.com"

# Коди відповіді, які вважаються успішними
SUCCESS_CODES=(2** 3**)

# Шлях до лог-файлу
LOGFILE="/var/log/myapp.log"

# Перевірка коду відповіді веб-сервера
response=$(curl -sL -w "%{http_code}\\n" "$URL" -o /dev/null)

if [[ ! "${SUCCESS_CODES[@]}" =~ "${response}" ]]; then
  # Запис помилки до лог-файлу
  echo "$(date) - Error: HTTP status code $response" >> "$LOGFILE" 
fi
