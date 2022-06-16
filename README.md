# ACME Commerce
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
[![Heroku](https://heroku-badge.herokuapp.com/?app=heroku-badge)](https://polar-earth-21571.herokuapp.com)

## Cobertura de Teste - SimpleCov
![image](https://user-images.githubusercontent.com/92264330/174062809-0b466bc4-0e2d-422b-b656-3a99c6717c94.png)

## 📖 Descrição
ACME Commerce agora possuí uma plataforma online para gerenciamento

- **User:** Cadastra, visualiza, edita e apaga ordens de serviços, produtos, categorias e clientes, além de verificar os produtos mais vendidos e verificar os produtos por categorias.

## ⚙️ Requisitos
 - Ruby 3.1.2
 - Rails 7.0.3
 - PostgreSQL 12.11

## 🚀 Instrução
Use o seguinte comando para clonar o repositório:
```sh
git clone git@github.com:philipeleandro/acme_commerce.git
```
Rode os comandos 
 - `cd ./acme_commerce`
 - `bundle install`
 - `rails db:drop`
 - `rails db:create`
 - `rails db:migrate`
 - `rake setup_csv:import`
 - `rails server`
 
## 🖥️ Diagrama de modelos
`https://github.com/philipeleandro/acme_commerce/blob/main/erd.pdf`

## 🚀 A aplicação contempla:
 - Ruby on Rails e Postgres
 - Rake task para popular banco de dados com arquivo CSV 
 - Autenticação com gem `Devise`
 - 100% de cobrimento de teste
 - Deploy Heroku

  OBS: Rake Task encontra-se no caminho `./lib/tasks/setup_csv.rake` e o arquivo CSV em `./csv/planilha-acmecommerce.csv`

## 🖥️ O que fazer no ACME Commerce?

O usuário ao se cadastrar na plataforma terá acesso e poderá cadastrar, visualizar, editar e apagar ordens de serviços, produtos, categorias e clientes, assim podendo fazer a gestão da empresa. Com a população do banco de dados a partir do arquivo CSV pode-se ter acesso aos dados antigos.

