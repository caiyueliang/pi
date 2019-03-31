# HOST_IP=registry-face.maysatech.com
#build
docker build -t faceboxes_depend:v1.0 -f Dockerfile_faceboxes .

# tag and push
# docker tag faceboxes_depend:v1.0 $HOST_IP:5000/faceboxes_depend:v1.0
# docker push $HOST_IP:5000/faceboxes_depend:v1.0
