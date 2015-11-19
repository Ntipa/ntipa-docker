map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}

upstream gitlab_prod {
        server 192.168.111.34:80;
}


server {
        listen 80 ;
	server_name gitlab.ntipa.com;

        location / {
            proxy_pass http://gitlab_prod;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }
          


}
                                                                                                                                              
