#/bin/sh

echo "name=" | tr -d '\n'
read OUTPUT

if [ -z $OUTPUT ]; then
	echo "OUTPUT NULL"
	exit
fi

echo "path=" | tr -d '\n'

read URL
if [ -z $URL ]; then
	echo "URL NULL"
	exit
fi

sed -i "s/file-tree/${URL}/g" copy-dir/kustomize/ingress.yaml

sed -i "s/home-view-single-file-tree/${OUTPUT}/g" copy-dir/kustomize/service.yaml
sed -i "s/home-view-single-file-tree/${OUTPUT}/g" copy-dir/kustomize/ingress.yaml
sed -i "s/home-view-single-file-tree/${OUTPUT}/g" copy-dir/kustomize/deployment.yaml

cp -av copy-dir/deploy-kustomize.sh	kcert2-${OUTPUT}/docker
cp -av copy-dir/kustomize/		kcert2-${OUTPUT}

cd copy-dir
./run.sh
cd ../


cd kcert2-${OUTPUT}/docker
./init-${OUTPUT}.sh
./run-dev-as-service.sh


echo "press enter"
read enter

./deploy-kustomize.sh
