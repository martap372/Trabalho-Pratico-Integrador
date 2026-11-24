# Relatorio de evidencias - Trabalho Pratico Integrador 01-06

Nome: Marta Pinto Pereira   Data: 24/11/2026
URL do repositorio Git: https://github.com/martap372/Trabalho-Pratico-Integrador

## E01 - Ambiente (1 valor)
Comandos e versoes observadas:
![Versões](images/image-1.png)
A API está em app.py, os testes em test_app.py, na pasta testes, o Compose em compose.yaml e a pipeline em Jenkinsfile.

## E02 - Dockerfile e container (3 valores)
Tag da imagem; docker ps; HTTP /health; utilizador efetivo do container:
A tag da imagem é natixis-support:1.0, portas 127.0.0.1:18080->8000/tcp (18080 no host e 8000 no container). O utilizador efetivo é appuser.
![docker ps](images/image-2.png)
![curl](images/image-3.png)
![id](images/image-5.png)
![docker logs](images/image-4.png)

## E03 - Compose, DNS, healthcheck e volume (4 valores)
Resultado de docker compose config; health; teste checker -> api; contador antes/depois da recriacao:
![docker compose config](images/image-6.png)
![docker compose ps](images/image-7.png)
![health](images/image-8.png)
![contador antes](images/image-9.png)
![contaddor depois](images/image-10.png)
O contador não foi perdido porque foi criado um volume persistente /data, que guarda os dados no Docker host e não no container em si, por isso é que eles se mantêm com a recriação do container.

## E04 - Incidente Docker (3 valores)
Sintoma, comandos de investigacao, causa-raiz, alteracao realizada, prova da recuperacao e contador preservado:
![health](images/image-12.png)
O problema, como se pode observar pelos dois comandos na imagem abaixo, é que o compose mapeia o tráfego para a porta 8000 enquanto o incidente.yaml escuta na porta 8001.
![Investigação](images/image-11.png)
Se corrigirmos a porta para 8000, obtemos os seguintes resultados, com o contador ainda preservado:
![Recuperação](images/image-13.png)

## E05 - Git (3 valores)
Branch, hashes de commits, merge e tag v1.0.0:
![git merge](images/image-15.png)
Na imagem abaixo podemos ver os dois commits: o commit com hash 2ed8fcb no branch fix/health-info com a tag v1.0.0 e o commit com hash 8af03e9 no main branch.
![git log](images/image-14.png)

## E06 - Jenkins SUCCESS (4 valores)
URL/numero do build, etapas e identificador da imagem construida:
![Jenkins pipeline](images/image-16.png)
![build](images/image-17.png)
O número do build é #3 e a URL é http://localhost:8080/job/natixis-support/lastBuild/.
O identificador da imagem é o seguinte:
![docker image inspect](images/image-18.png)

## E07 - Jenkins FAILURE e recuperacao (2 valores)
Build FAILURE, etapa que falhou e excerto relevante do log; build SUCCESS apos correcao:
![Falha](images/image-19.png)
![Pipeline](images/image-20.png)
![Erro](images/image-21.png)
Após correção:
![Sucesso](images/image-22.png)

## Verificacao final
[x] Dockerfile [x] compose.yaml [x] app.py [x] tests/ [x] Jenkinsfile
[x] Historico Git [x] Tag v1.0.0 [x] Evidencias E01-E07
