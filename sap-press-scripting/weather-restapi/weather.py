import requests

# The script determines the weather in Tokyo, Japan and logs this information
# into a file called weather.csv, by the way you need to sign up to register
# for an api key from the website.

# https://www.weatherapi.com/
# https://api.weatherapi.com/v1/current.json?key=xxxxx&q=tokyo

key = "xxxxx"
location = "Tokyo"
base = "https://api.weatherapi.com/v1/current.json"
url = base + "?key=" + key + "&q=" + location
data = requests.get(url).json()

temp = data['current']['temp_c']
condition = data['current']['condition']['text']
time = data['location']['localtime']

with open('weather.csv', 'a') as f:
    f.write("%s,%s,%s\n" % (time, condition, temp))