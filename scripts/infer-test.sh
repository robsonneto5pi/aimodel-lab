#!/bin/sh
# Testa completion e mede velocidade (executar dentro do pod, servidor ja ativo)
curl -s -m 120 http://localhost:8080/v1/completions -H 'Content-Type: application/json' \
  -d '{"prompt":"def fibonacci(n):","max_tokens":48,"temperature":0}' > /tmp/out.json
head -c 700 /tmp/out.json
echo
grep -E "tokens per second" /tmp/server.log | tail -n 2
