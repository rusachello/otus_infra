cat > /etc/nginx/sites-available/reddit-app.conf <<EOF
server {
    listen 80;
    server_name 10.170.7.215;
    location / {
        proxy_pass http://127.0.0.1:9292;
    }
}
EOF

ln -s /etc/nginx/sites-available/reddit-app.conf /etc/nginx/sites-enabled/
systemctl restart nginx
systemctl restart puma
