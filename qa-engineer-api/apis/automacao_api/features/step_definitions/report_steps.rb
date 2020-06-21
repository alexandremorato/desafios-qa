Dado("que tenha um token válido") do
    # Observação - Verificar no README como criar as variáveis de ambiente para execução desse passo.    
end

Quando("realizar a criação de um relatório com os seguintes dados:") do |table|
    @data = table.rows_hash
    @response = create_report(@data, $token)
end

Então("o relatório não deve ser criado") do
    expect(@response.code).to eql 400
end

Então("deve ser retornado a seguinte mensagem de erro") do |msg|
    expect(@response["message"]).to eql msg 
end

Então("as fontes de consultas devem retornar que os dados estão inconsistentes") do
    expect(@response.code).to eql 200
    number_report = @response["result"]["numero"]
    response_get_report = get_report_status_completed(number_report, $token)
    expect(response_get_report["result"]["resultado"]).to eql "INVALID"
    expect(response_get_report["result"]["mensagem"]).to include(@data["Mensagem"])
end

Quando("realizar a criação de um relatório com dados reais:") do |table|
    @data = table.rows_hash
    @response = create_report(@data, $token)
end

Quando("realizar a criação do relatório com dados reais") do
    data = create_real_data
    @response_create_report = create_report(data, $token)
end

Então("os dados são validados com sucesso nas fontes de consultas") do
    expect(@response_create_report.code).to eql 200
    number_report = @response_create_report["result"]["numero"]
    response_get_report = get_report_status_completed(number_report, $token)
    expect(response_get_report["result"]["resultado"]).to eql "VALID"
    expect(response_get_report["result"]["mensagem"]).to eql "Válido."
end

Dado("que tenha um token inválido") do
  $token = ENV['TOKEN_INVALIDO']
end

Então("o acesso não deve ser permitido") do
    expect(@response.code).to eql 401
end