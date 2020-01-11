require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    user = User.find_by(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/account'
    else
      redirect '/error'
    end
  end

  get '/account' do
    if !Helpers.is_logged_in?(session)
      redirect '/error'
    end

    @user = Helpers.current_user(session)
    if Helpers.is_logged_in?(session) && Helpers.current_user(session) == @user
      erb :account
    end
  end

  get '/logout' do
    session.clear
    
    redirect '/'
  end

  get '/error' do
    erb :error
  end


end

