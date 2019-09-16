
# DBServer Teste

## Descrição
Automação criada para o teste da empresa DBServer, ultilizando tecnologias como cucumber, selenium e docker.

## Tecnologias utilizadas
 - Ruby
 - Watir
 - Cucumber
 - Docker
 - Allure Report 2.0

## Configuração de ambiente (Links das libs, drivers...)
Para executar os testes é necessario ter o docker e docker-compose instalado na maquina.
 - https://www.docker.com/get-started

Depois de instalado, siga no terminal ou cmd para onde o repositório foi clonado e inicie docker swarm

    docker swarm init

Então digite:

    docker-compose up -d --build

###### ** Apenas a primeira vez é necessario o `--build`.

Depois disso execute:

    docker exec -it dbserver_app_1 cucumber BROWSER=chrome FULLSCREEN=true --format AllureCucumber::Formatter --out allure/

### Informaçoes extras
Para ver a organização do docker e como funciona, digite localhost:9000 para visualizar o portainer:

**Usuario**: admin
**Senha**: 12345678

O relatório pode ser visto na pasta results dentro da pasta cucumber, nativamente apenas edge e internet explorer podem visualizar o index.html, mas se você instalar o Allure atravez do npm.

Dentro do terminal ou cmd digite:

    npm install -g allure
    npm install -g allure-commandline


E então dentro da pasta de results:

    allure serve
    
Assim poderá visualizar em qualquer navegador.

###### O Allure precisa do JAVA para rodar

# Autor
### Leandro Bezerra
