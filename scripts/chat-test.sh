#!/bin/sh
# Teste de chat com o Granite (executar no container llm-chat)
curl -s -m 180 http://localhost:8080/v1/chat/completions -H 'Content-Type: application/json' \
  -d '{"messages":[{"role":"user","content":"Explique em uma frase o que e um LLM."}],"max_tokens":60,"temperature":0}' > /tmp/chat.json
head -c 600 /tmp/chat.json
echo
grep -o '"predicted_per_second":[0-9.]*' /tmp/chat.json
