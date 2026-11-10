#!/bin/sh
# Diagnostico de conectividade com o GitHub (executar no bastion ou em um pod)
echo "DNS github.ibm.com: $(getent hosts github.ibm.com | head -n1)"
for h in github.ibm.com github.com 9.209.58.192; do
  code=$(curl -sk -o /dev/null -m 10 -w '%{http_code}' https://$h)
  echo "https://$h -> $code"
done
