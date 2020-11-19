class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        binding.pry
    end
end