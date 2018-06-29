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
	byebug
	x = User.new(params[:user])
	if x.save
	redirect "/#{x.email}/#{x.username}"
	else
	puts "#{x.errors.full_messages}"
	end 
end

get '/sign_in' do
	erb :"sign_in"
end

post '/sign_in' do
	# byebug
	user = User.find_by(username: params[:username])
	if user && user.authenticate(params[:password])
		@success = "You got in !"
		erb :"home"
	else 
		p "poop"
	end
end

get '/:email/:username' do

	p "this is your mail #{params[:email]}"
	p "this is your username #{params[:username]}"
	erb :"signup_success"
	
end


