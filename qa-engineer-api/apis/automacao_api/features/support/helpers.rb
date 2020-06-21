module Helpers
    def get_report_status_completed(number_report, token)
        response = get_report(number_report, token)
        status = response["result"]["status"]
        i = 1
        
        while (status != 'CONCLUIDO') && (i < 10)
            sleep 60
            response = get_report(number_report, token)
            status = response["result"]["status"]
            i += 1
            status
        end
        response
    end

    def create_real_data()
        data = Hash.new
        data['Nome'] = ENV['NOME']
        data['Data_nascimento'] = ENV['DATA_NASC']
        data['CPF'] = ENV['CPF']
        data
    end    
end