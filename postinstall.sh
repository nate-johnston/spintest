echo "The package was installed!  Yay!" > /etc/wowza
cat /etc/wowza

/bin/mkdir -p /usr/share/nginx/html/healthcheck 2>/dev/null
/bin/cp -v /app/nate-test/content.html /usr/share/nginx/html/index.html
/bin/cp -v /app/nate-test/ok.html /usr/share/nginx/html/healthcheck/index.html
/bin/cp -v /app/nate-test/spintest.conf /etc/nginx/sites-enabled/spintest.conf
/bin/rm -f /etc/nginx/sites-available/default
/usr/sbin/service nginx restart
