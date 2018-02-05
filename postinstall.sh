echo "The package was installed!  Yay!" > /etc/wowza
cat /etc/wowza

/bin/mkdir -p /usr/share/nginx/html 2>/dev/null
/bin/cp -v /app/nate-test/content.html /usr/share/nginx/html/index.html
/usr/sbin/service nginx restart
