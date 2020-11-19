class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        user = User.new(params)

        if user.save
            flash[:message] = "You've successfully signed up! Please login"

            redirect '/login'
        else
            flash[:message] = 'errors'
            redirect '/signup'
        end
    end
end