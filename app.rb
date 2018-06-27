require_relative './config/init.rb'
set :run, true

get '/' do
  @name = "Bob Smith"
  @date = DateTime.now
  erb :"home"
end

get '/sign_up' do
	erb :"sign_up"
end

post '/sign_up' do
	# byebug
	User.create(username: params[:username], password: params[:password], email: params[:email])
	redirect '/'
end


