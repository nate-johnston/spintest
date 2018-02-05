echo "The package was installed!  Yay!" > /etc/wowza
cat /etc/wowza

/bin/cp -v /app/nate-test/content.html /usr/share/nginx/html/index.html
/bin/mkdir -p /usr/share/nginx/html 2>/dev/null
/usr/sbin/service nginx restart
