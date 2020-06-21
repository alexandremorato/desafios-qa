module HelpersRequests

    def get_report(number_report, token)
        response = HTTParty.get(
            "#{$end_point}/relatorios/#{number_report}", 
            headers: { 
            'Content-Type' => 'application/json', 
            'Authorization' => token
            }
         )
        response
    end
    
    def create_report(data, token)
        response = HTTParty.post(
            "#{$end_point}/relatorios",
            headers: { 
            'Content-Type' => 'application/json', 
            'Authorization' => token
            },
            body: {
                "matriz": "consultaPessoaDefault",
                "parametros": {
                  "cpf_data_de_nascimento": data["Data_nascimento"],
                  "cpf_nome": data["Nome"],
                  "cpf_numero": data["CPF"]
                }
            }.to_json
         )
        response
    end
end    