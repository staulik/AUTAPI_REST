describe 'fazer uma requsição' do
it 'post' do 
    @body = 
    {
        "user": {
        "email": "brunobatistaa22@gmail.com",
        "password": "112345",
        "password_confirmation": "112345"
        }    
}.to_json

@headers = {
             "Accept": 'application/vnd.tasksmanager.v2',
                      'Content-Type': 'application/json'
}

@request = HTTParty.post('https://api-de-tarefas.herokuapp.com/users',body: @body, headers: @headers)
puts @request
end 
end