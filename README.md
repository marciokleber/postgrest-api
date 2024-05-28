# Laboratório PostgREST API
>Aplicação laboral para teste da tecnologia PostgREST.
## Requirements:
- [x] docker compose
      
## Execução:

### Iniciando o postgres DB ....
```
docker compose up postgres
```
- ***Aguarde e verifique se o script de inicialização executou sem erros.***
### Iniciando o PgAdmin4 ....
```
docker compose up pgadmin4
```
### Iniciando o PostgREST ....
```
docker compose up postgrest
```


>## Endpoints
>>#### FindById
>>``` 
>>curl http://localhost:3000/produto?id=eq.1
>>```
>
>>#### FindAll
>>``` 
>>curl http://localhost:3000/produto
>>```
>
>>#### Insert
>>``` 
>>curl http://localhost:3000/produto -X POST \
>>     -H "Content-Type: application/json" \
>>     -d '{"nome": "Moeda de 1 real","descricao":" Estou vendo uma moeda na minha mesa"}' |jq
>>```
>
>>#### Update
>>``` 
>>curl http://localhost:3000/produto?id=eq.11 -X PATCH \
>>     -H "Content-Type: application/json" \
>>     -d '{"nome": "Nota de 5 real","descricao":" Queria tanto um café, o sono já está batendo!"}' |jq
>>```
>
>>#### DeleteById
>>``` 
>>curl -X DELETE http://localhost:3000/produto?id=eq.11 \
>>    -H "Prefer: return=representation"
>>``` 
