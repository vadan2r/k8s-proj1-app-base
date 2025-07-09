echo "Criando as imagens do banco de dados..."

docker build -t k8s-proj1-app-base-database -f database/Dockerfile .
docker build -t k8s-proj1-app-base-database-migrations -f database/migrations/Dockerfile .

echo "Realizando o push das imagens para o Docker Hub..."

docker push k8s-proj1-app-base-database
docker push k8s-proj1-app-base-database-migrations

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f services.yml

echo "Criando os deployments no cluster kubernetes..."

kubectl apply -f ./deployment.yml