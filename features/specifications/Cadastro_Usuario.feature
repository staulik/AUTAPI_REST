#language: pt
Funcionalidade: Manter o cadastro de usuários através da API
Como um aplicação de serviço
Quero enviar requisições para Cadastro de Usuário
para verificar se o cadastro é funciona corretamente


Cenario: Validar a API de criação de Usuário
Dado que eu tenha um payload padrão
Quando é enviada uma requisição para a criação do usuário 
Então o usuário é criado

@consulta
Cenario: Validar a API de consulta de Usuário
Dado que eu tenha o usuário cadastrado
Quando é enviada uma requisição de consulta 
Então a API me retorna a informação do usuário
