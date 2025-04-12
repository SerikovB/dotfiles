import json
import os
import sys
import time
import pathlib
import requests


def get_icon(icons: dict, icon: str):
    return icons[icon]


def get_weather(token: str, units: str, icons: dict, location: dict):
    latitude = location["latitude"]
    longitude = location["longitude"]
    city = location["city"]
    country = location["country"]
    url = "https://api.openweathermap.org/data/2.5/weather?" \
        f"appid={token}" \
        f"&lat={latitude}&lon={longitude}" \
        f"&units={units}"

    response = requests.get(url).json()
    return {
            "location": f"{city}, {country}",
            "icon": get_icon(icons, response["weather"][0]["icon"]),
            "desc": response["weather"][0]["description"].capitalize(),
            "temp": str(round(response["main"]["temp"])),
            "feels_like": str(round(response['main']['feels_like'])),
            "humidity": str(response['main']['humidity']),
            "pressure": str(response['main']['pressure'])
            }


def get_location(config: dict):
    # response = requests.get('https://api64.ipify.org/?format=json').json()
    # ip = response["ip"]
    # response = requests.get(f'https://ipapi.co/{ip}/json/').json()
    response = requests.get('http://ipinfo.io/json').json()
    return {
            # "latitude": response.get("latitude"),
            "latitude": response.get("loc").split(',')[0],
            # "longitude": response.get("longitude"),
            "longitude": response.get("loc").split(',')[1],
            "city": response.get("city"),
            "country": response.get("country")
        }


def main(config: dict, FALLBACK: dict):
    token = config["tokens"]["openweather"]
    units = config["weather"]["units"]
    icons = config["weather"]["icons"]
    while True:
        try:
            location = get_location(config)
            data = get_weather(token, units, icons, location)
            sys.stdout.write(json.dumps(data) + '\n')
            sys.stdout.flush()
            time.sleep(1800)
        except (requests.exceptions.ConnectionError, KeyError):
            sys.stdout.write(json.dumps(FALLBACK) + '\n')
            sys.stdout.flush()
            time.sleep(5)


if __name__ == "__main__":
    CONFIG_PATH = os.path.expandvars("${XDG_CONFIG_HOME}/eww/eww.json")
    CONFIG = json.loads(pathlib.PosixPath(CONFIG_PATH).read_text())
    FALLBACK = {
            "location": "NA",
            "icon": CONFIG['weather']['icons']['default'],
            "desc": "NA",
            "temp": "NA",
            "feels_like": "NA",
            "humidity": "NA",
            "pressure": "NA",
            }
    try:
        sys.stdout.write(json.dumps(FALLBACK) + '\n')
        sys.stdout.flush()
        main(CONFIG, FALLBACK)
    except KeyboardInterrupt:
        exit(0)
