# Miferia mountebak grpc sandbox

## Proto repos
* https://github.com/getmiferia/proto.miferia.git
* https://github.com/getmiferia/proto.core-payment.git
* https://github.com/getmiferia/proto.payment-facilitator.git
* https://github.com/getmiferia/proto.spei-facilitator.git
* https://github.com/getmiferia/proto.openpay.git
* https://github.com/getmiferia/proto.card.git

## Configs
* mountebank default port 2525
  
## Imposters
|  Proto repo | Imposter file  | port  | 
|---|---|---|
proto.card| card.ejs|    2561
proto.card| card-datasec.ejs| 2562
proto.miferia| card-security.ejs| 2571
proto.miferia| auth.ejs| 2572
proto.miferia| address.ejs| 2573
|||

## Build mountebank docker image without imposters
```
docker build -t  mountebank.miferia -f Dockerfile . --build-arg GIT_TOKEN=$GIT_TOKEN
```
## Run mountebank docker
```
docker run -it -p 2525:2525 mountebank.miferia
```
## Build and run with docker compose

## Run docker image