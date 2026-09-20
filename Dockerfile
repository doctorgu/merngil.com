# Lightweight Nginx image for Google Cloud Build & Cloud Run
FROM nginx:alpine

# Cloud Run defaults to port 8080, but can inject custom $PORT
ENV PORT=8080

# Copy Nginx configuration template
# The official nginx entrypoint automatically runs envsubst on files in /etc/nginx/templates/
COPY default.conf.template /etc/nginx/templates/default.conf.template

# Copy index.html as static fallback
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
