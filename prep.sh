docker network create shared_backend
docker run -d --name dingoplay-redis --network shared_backend -p 6379:6379 -v dingoplay_redisdata:/data --restart unless-stopped redis:8-alpine redis-server --save 60 1
docker run -d --name dingoplay-postgres --network shared_backend -e POSTGRES_USER=dingouser -e POSTGRES_PASSWORD=urpass -e POSTGRES_DB=dingoplay -p 5432:5432 -v dingoplay_pgdata:/var/lib/postgresql/data --restart unless-stopped pgvector/pgvector:pg16
cd website
cp .env.example .env
cd ..
