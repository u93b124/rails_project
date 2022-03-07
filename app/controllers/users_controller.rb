class UsersController < ApplicationController
    def index
        @hello = 'hello world 2222'
        render template: 'users/index'

    end
end
