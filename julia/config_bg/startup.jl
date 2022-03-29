# Configuración servidor proxy 
ENV["HTTP_PROXY"] = "http://130.1.11.66:80"
ENV["HTTPS_PROXY"] = "http://130.1.11.66:80"
ENV["JULIA_SSL_NO_VERIFY_HOSTS"] = "github.com"