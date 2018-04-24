require "sinatra"
require "date"
require "sinatra/reloader" if development?
require "pry" if development? || test?
require_relative "config/application"

enable :sessions
set :bind, "0.0.0.0"  # bind to all interfaces

get "/" do
  redirect "/parties"
end

get "/parties" do
  @parties = Party.all
  erb :"parties/index"
end

get "/parties/new" do
  erb :"parties/new"
end

get "/parties/:id" do
  @party = Party.all.find{|party| party.id == params[:id].to_i }
  erb :"parties/show"
end

post "/parties" do
  @errors = []
  @name = params["name"]
  @description = params["description"]
  @location = params["location"]

  if @name === ""
    @errors.push("Please supply a party name")
  end

  if @description === "" || @escription.length < 21
    @errors.push("Description must be at least 20 characters long")
  end

  if @location === ""
    @errors.push("Please supply a party location")
  end

  if @errors.length > 0
    flash.now[:error] = "Please completely fill out all fields"
    @errors
    erb :"parties/new"
  else
    new_party = Party.create!(
      name: @name,
      description: @description,
      location: @location,
      created_at: DateTime.now,
      updated_at: DateTime.now
    )
    if new_party.errors.full_messages.empty?
      flash[:success] = "Your new party #{new_party.name} was saved successfully."
      redirect "/parties/#{new_party.id}"
    else
      flash[:error] = "#{new_party.errors.full_messages}"
      erb :"parties/new"
    end
  end
end

get "/friends" do
  @friends = Friend.all.order(first_name: :asc)
  erb :"friends/index"
end

get "/friends/new" do
  erb :"friends/new"
end

post "/friends" do
  @errors = []
  first_name = params["first_name"]
  last_name = params["last_name"]

  if first_name === ""
    @errors.push("Please supply a friend's first name")
  end

  if last_name === ""
    @errors.push("Please supply a friend's last name")
  end

  if @errors.length > 0
    flash.now[:error] = "Please completely fill out all fields"
    @errors
    erb :"friends/new"
  else
    new_friend = Friend.create(
      first_name: first_name,
      last_name: last_name,
      created_at: DateTime.now,
      updated_at: DateTime.now
    )
    if new_friend.errors.full_messages.empty?
      flash[:success] = "Your new friend #{new_friend.full_name} was saved successfully."
      redirect "/friends"
    else
      flash[:error] = "#{new_friend.errors.full_messages}"
      erb :"friends/new"
    end
  end
end
