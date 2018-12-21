require 'sinatra'
require "sinatra/reloader"

# Run this script with `bundle exec ruby app.rb`
require 'sqlite3'
require 'active_record'

#require classes
# require './models/cake.rb'
require './models/comment.rb'
require './models/customer.rb'
require './models/post.rb'
require './models/user.rb'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'
require 'csv'
require 'time'

# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/carson.db'
)

register Sinatra::Reloader
enable :sessions

get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @all_posts = Post.all.reverse

    erb :index
  else
    erb :not_allowed
  end
end

get '/timeline' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @all_posts = @user.posts.all.reverse

    erb :timeline
  else
    erb :not_allowed
  end

end
get '/user/:id' do
  @user = User.find(session[:user_id])
  @id = params['id']
  @posts = User.find(@id).posts.all.reverse
  erb :guesthome
end
post '/user/:id' do
  nowTime = Time.now
  Comment.create(content: params["content"], user_id: session[:user_id], post_id: params[:id], time: nowTime)
  redirect '/user/:id'
end
get '/user/:id' do
  Comment.find(params["id"]).destroy
  redirect '/user/:id'
end
get '/post/delete/:id' do
  # Post.find(params["id"]).comment.destroy
  Post.find(params["id"]).destroy
  redirect '/'

end

get '/timeline/post/delete/:id' do
  Post.find(params["id"]).destroy

  redirect '/timeline'

end
get '/comment/delete/:id' do
  Comment.find(params["id"]).destroy
  redirect '/'
end
get '/timeline/comment/delete/:id' do
  Comment.find(params["id"]).destroy
  redirect '/timeline'
end

post '/timeline/user/posts' do
  nowTime = Time.now
  Post.create(content: params["content"], user_id: session[:user_id], time: nowTime)
  redirect '/timeline'
end
post '/user/posts' do
  nowTime = Time.now
  Post.create(content: params["content"], user_id: session[:user_id], time: nowTime)
  redirect '/'
end
post '/timeline/post/:id/comments' do
  nowTime = Time.now
  Comment.create(content: params["content"], user_id: session[:user_id], post_id: params[:id], time: nowTime)
  redirect '/timeline'

end

post '/post/:id/comments' do
  nowTime = Time.now
  Comment.create(content: params["content"], user_id: session[:user_id], post_id: params[:id], time: nowTime)
  redirect '/'

end


# post '/sales' do
#   puts ">>>>>"
#   puts params
#   puts ">>>>>"
#
#   # make a customer record
#   customer_instance = Customer.create(
#     first_name: params["first_name"],
#     last_name: params["last_name"],
#     gender: params["gender"],
#     phone_number: params["phone_number"],
#     email: params["email"]
#   )
#   # make a car record
#   car_instance = Car.create(
#     make: params["make"],
#     model: params["model"],
#     year: params["year"],
#     sale_markup: params["sale_markup"],
#     cost_price: params["cost_price"]
#   )
#   # make a Transaction with both
#   Sale.create(car: car_instance, customer: customer_instance)
#
#   redirect '/sales'
# end

get '/login' do
  erb :login
end

post '/users/login' do
  user = User.find_by(user_name: params["user"], password: params["password"])
  puts ">>>>>>>>>>>>"
  puts user.inspect
  puts ">>>>>>>>>>>>"
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/signup' do
  erb :signup
end

post '/users/signup' do

  temp_user = User.find_by(user_name: params["user"])
  if temp_user
    redirect '/login'
  else
    nowTime = Time.now
    user = User.create(user_name: params["user"], password: params["password"], email: params["email"], image:params["image_link"], age: params['age'], bio: params['about_you'], time: nowTime)
    session[:user_id] = user.id
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end
