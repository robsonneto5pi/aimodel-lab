#!/bin/sh
# Busca repositorios GGUF no Hugging Face (executar dentro do pod)
for q in starcoder2-3b-gguf Llama-3-8B-Instruct-gguf granite-3.3-8b-instruct-gguf; do
  echo "== $q"
  curl -s -m 20 "https://huggingface.co/api/models?search=$q&sort=downloads&limit=4" | grep -o '"id":"[^"]*"'
done
