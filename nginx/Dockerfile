FROM nginx:alpine

# Nginx part
COPY nginx.conf /etc/nginx/nginx.conf
COPY proxy_params.conf /etc/nginx/proxy_params
COPY mokey.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
