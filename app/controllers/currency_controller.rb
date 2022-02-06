class CurrencyController < ApplicationController
  def homepage
    render({ :template => "/homepage.html.erb"})
  end

  def get_currency_symbols
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @array_of_symbols = @parsed_data.fetch("symbols").keys
    return @array_of_symbols
  end

  def currency_display
    get_currency_symbols()
    render({ :template => "/currency_templates/currency_display.html.erb"})
  end

  def forex_display
    get_currency_symbols()
    @from_symbol = params.fetch("from_symbol")
    render({ :template => "/currency_templates/forex_display.html.erb"})
  end

  def forex_calculation
    get_currency_symbols()
    @from_symbol = params.fetch("from_symbol")
    @to_symbol = params.fetch("to_symbol")
    @url = "https://api.exchangerate.host/convert?from="+@from_symbol+"&to="+@to_symbol
    @raw_exchange_data = open(@url).read
    @parsed_data = JSON.parse(@raw_exchange_data)
    @rate = @parsed_data.fetch("info").fetch("rate")
    render({ :template => "/currency_templates/forex_calculation.html.erb"})
  end

  def covid
    render({ :template => "/covid.html.erb"})
  end
end