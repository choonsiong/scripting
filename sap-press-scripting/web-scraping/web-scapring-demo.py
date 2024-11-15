import requests
from bs4 import BeautifulSoup

# This script extracts the version number and the link to the
# release notes from git-scm.com. Note the script only works as
# long as the structure of the web page does not change.

# Install following first:
# pip3 install requests
# pip3 install beautifulsoup4

response = requests.get("https://git-scm.com/downloads")
dom = BeautifulSoup(response.content, 'html.parser')

version = dom.find('span', class_='version')
print('Git version:', version.text.strip())

url = version.parent.find('a')
print("What's new:", url.attrs['href'])