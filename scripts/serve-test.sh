#!/bin/sh
# Sobe o llama-server com StarCoder2-3B e testa a inferencia (executar dentro do pod)
export HOME=/tmp
nohup llama-server -hf second-state/StarCoder2-3B-GGUF:Q4_K_M --host 0.0.0.0 --port 8080 -c 4096 > /tmp/server.log 2>&1 &
for i in $(seq 1 60); do
  if curl -s -m 2 http://localhost:8080/health | grep -q ok; then echo "server pronto apos ${i}x5s"; break; fi
  sleep 5
done
tail -n 5 /tmp/server.log
echo "--- completion"
curl -s -m 120 http://localhost:8080/v1/completions -H 'Content-Type: application/json' \
  -d '{"prompt":"def fibonacci(n):","max_tokens":48,"temperature":0}'
echo
grep -E "tokens per second|eval time" /tmp/server.log | tail -n 3
