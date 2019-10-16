Dado("que eu tenha um payload padrão") do
  @manter_user = CRUD.new
 end
  
Quando("é enviada uma requisição para a criação do usuário") do
   @manter_user.create
    puts "Requisição com exito: #{@manter_user.create.message} para código #{@manter_user.create.code}" 
 end
  
Então("são retornadas as informações da inclusão") do
   puts @manter_user.create.body
 end

  Dado("que eu tenha o usuário cadastrado") do 
    @manter_user = CRUD.new
    @manter_user.create
    puts @manter_user.create.body
    
  end                                                                                 
            
  Quando("é enviada uma requisição de consulta") do                                   
    @manter_user.retrieve
    puts "Consulta processada com sucesso #{@manter_user.retrieve.code}"
  end                                                                                
                                                            
  Então("a API me retorna a informação do usuário") do                                
   puts CRUD.class_variable_get(:@@request).parsed_response['data']['attributes']['email'] 
  end                                                                                 