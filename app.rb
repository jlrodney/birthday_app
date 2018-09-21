require 'sinatra/base'
require 'date'

class Countdown < Sinatra::Base
  enable :sessions

  get '/' do
    # "Hello world!"
    erb :birthday
  end

  post '/action_page' do
    session[:name] = params[:name]
    session[:dob_day] = params[:dob_day]
    session[:dob_month] = params[:dob_month]
    # session[:number_days] params[:number_days]
    redirect '/birthday_message'
  end

  get '/birthday_message' do
    @name = session[:name]
    @dob_day = session[:dob_day].to_i
    @dob_month = session[:dob_month].to_i
    # @number_days = session[:number_days]
    erb :birthday_message
  end

  def days_until_birthday
      bday = Date.new(Date.today.year, @dob_month, @dob_day)
      if Date.today >= bday
        bday += 365
      end
      (bday - Date.today).to_i
  end


  run! if app_file == $0


end
