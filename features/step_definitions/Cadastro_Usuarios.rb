Dado("que eu tenha um payload padrão") do
    @base_url  = 'https://api-de-tarefas.herokuapp.com/users'
    @body = 
    {
    "user": {
    "email": Faker::Internet.email,
    "password": :@password,
    "password_confirmation": :@password
     }    
}.to_json

@headers = {
             "Accept": 'application/vnd.tasksmanager.v2',
                      'Content-Type': 'application/json'
}
end
  
Quando("é enviada uma requisição para a criação do usuário") do
    @request = HTTParty.post(@base_url, body: @body, headers: @headers)
 end
  
Então("o usuário é criado") do
    expect(@request.code).to eq(201)
    expect(@request.message).to eq("Created")
    puts "A mensagem de sucesso é: #{@request.message} para código #{@request.code}"
    puts @request.body
  
  end

  Dado("que eu tenha o usuário cadastrado") do                                        
      @base_url  = 'https://api-de-tarefas.herokuapp.com/users'
      @body = 
      {
      "user": {
      "email": Faker::Internet.email,
      "password": :@password,
      "password_confirmation": :@password
       }    
  }.to_json
  
  @headers = {
               "Accept": 'application/vnd.tasksmanager.v2',
                        'Content-Type': 'application/json'
  }

  @request = HTTParty.post(@base_url, body: @body, headers: @headers)

  puts "O usuário" % @request.parsed_response['data']['attributes']['email'] % "foi incluído..." 
  end                                                                                 
                                                                                      
  Quando("é enviada uma requisição de consulta") do                                   
     @response = HTTParty.get('https://api-de-tarefas.herokuapp.com/contacts')
    # @consulta = Contato.get('/contacts')
        
  end                                                                                 
                                                                                     
  Então("a API me retorna a informação do usuário") do                                
  puts @request.parsed_response['data']['attributes']['email']  
   
  end                                                                                 