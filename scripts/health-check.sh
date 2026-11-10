#!/bin/sh
# Verifica os dois servidores LLM dentro do pod do workspace (executar no container llm-chat)
for p in 8080 8081; do
  printf "porta %s health: " "$p"
  curl -s -m 3 http://localhost:$p/health || printf "indisponivel"
  echo
done
