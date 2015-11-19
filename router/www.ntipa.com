server {
        listen 80 ;
        server_name www.ntipa.com;
        
	location / {
            proxy_pass http://10.10.130.29:80;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
          }
}
