import requests, cmd, sys
from bs4 import BeautifulSoup

#TODO: Rewrite music as an entirely contained python script
class GetURL(cmd.Cmd):
    intro = 'Welcome to the music player. Type help or ? to list commands.\n'
    song_name=input()
    payload = { 'search_query': song_name }
    r = requests.get('https://www.youtube.com/results', params=payload)
    soup = BeautifulSoup(r.text, "html.parser")
    
    hrefs = []
    for a in soup.find_all('a', href=True):
        hrefs.append(a['href'])
    
    matches = []
    for i in hrefs:
        if "watch?v=" in i:
            matches.append(i.replace("/watch?v=", ""))
    
    url = "https://www.youtube.com/watch?v={0}".format(matches[0])
    
    print(url)
    
    #for i in matches:
    #    print(i)
