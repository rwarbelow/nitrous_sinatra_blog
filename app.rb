require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

enable :sessions

configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
  def title
    if @title
      "#{@title}"
    else
      "Welcome."
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end


get "/posts/create" do
  @title = "Create Post"
  @post = Post.new
  erb :"posts/create"
end

get "/posts/:id" do 
  @post = Post.find(params[:id])
  @title = @post.title
  erb :"posts/show"
end

post "/posts" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "posts/#{@post.id}", :notice => "Congrats! Love the new post"
  else
    erb :"posts/create", :error => "Something went wrong. Please try again."
  end
end

get "/" do
  @posts = Post.order("created_at DESC")
  @title = "Welcome!"
  erb :"posts/index"
end

get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  @title = "Edit Form"
  erb :"posts/edit"
end
put "/posts/:id" do
  @post = Post.find(params[:id])
  @post.update(params[:post])
  redirect "/posts/#{@post.id}"
end