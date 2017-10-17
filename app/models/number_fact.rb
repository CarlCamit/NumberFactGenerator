class NumberFact < ApplicationRecord
    
    validates_presence_of :choice

    def format_date_api
        fun_date.strftime("%m/%d")
    end
    
    def random_number
        @number_response ||= HTTParty.get("http://numbersapi.com/#{fun_number}/math")
    end
    
    def random_year
        @year_response ||= HTTParty.get("http://numbersapi.com/#{fun_year}/year")
    end
    
    def random_date
        @date_response ||= HTTParty.get("http://numbersapi.com/#{format_date_api}/date")
    end

    def number_fact
        random_number['text']
    end

    def year_fact
        random_year['text']
    end

    def date_fact
        random_date['text']
    end
end
