docker run \
   -p 8000:9000 \
   -p 8001:9001 \
   --name minio1 \
   -e "MINIO_ROOT_USER=admin" \
   -e "MINIO_ROOT_PASSWORD=changeme" \
   -v ~/data:/data \
   minio/minio server /data --console-address ":9001"