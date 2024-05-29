#!/bin/bash

# Define as partes do token JWT
header='{"alg":"HS256","typ":"JWT"}'
payload='{"role":"web_auth"}'

# Codifica as partes em base64url
encoded_header=$(echo -n "$header" | base64 | tr -d '=' | tr '/+' '_-')
encoded_payload=$(echo -n "$payload" | base64 | tr -d '=' | tr '/+' '_-')

# Concatena as partes com um ponto
unsigned_token="$encoded_header.$encoded_payload"

# Define a chave secreta (substitua isso pela sua chave real)
secret="bsfGCkWS8Mb0T7fmjmSoyA7VO6hQ88Sx"

# Gera a assinatura usando HMAC-SHA256
signature=$(echo -n "$unsigned_token" | openssl dgst -sha256 -hmac "$secret" -binary | base64 | tr -d '=' | tr '/+' '_-')

# Concatena a assinatura com as partes anteriores
jwt_token="$unsigned_token.$signature"

echo "Token JWT: $jwt_token"

