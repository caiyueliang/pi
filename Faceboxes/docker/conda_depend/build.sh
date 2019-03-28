HOST_IP=registry-face.maysatech.com

#build
docker build -t conda_depend:v1.0 -f Dockerfile .
# tag push
docker tag conda_depend:v1.0 $HOST_IP:5000/conda_depend:v1.0
docker push $HOST_IP:5000/conda_depend:v1.0

#public conda_depend
# docker tag conda_depend:v1.0 registry.cn-hangzhou.aliyuncs.com/lijinchao/conda_depend:v1.0
# docker push registry.cxn-hangzhou.aliyuncs.com/lijinchao/conda_depend:v1.0