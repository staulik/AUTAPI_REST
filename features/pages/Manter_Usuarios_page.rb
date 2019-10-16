require 'HTTParty'
require 'httparty/request'
require 'httparty/response/headers'

#require_relative '..features/pages/hooks/hook.rb'

class CRUD

   include HTTParty

   def create  
     
  @@base_url  = 'https://api-de-tarefas.herokuapp.com/users'
    @@body = 
    {
    "user": {
    "email": Faker::Internet.email,
    "password":  :@password,
    "password_confirmation": :@password

     }    
}.to_json

@@headers = {
             "Accept": 'application/vnd.tasksmanager.v2',
                      'Content-Type': 'application/json'
}   
 
@@request = CRUD.post(@@base_url, body: @@body, headers: @@headers)

end
  
  def retrieve
    @@response = CRUD.get('https://api-de-tarefas.herokuapp.com/contacts') 
 end 
end
  
