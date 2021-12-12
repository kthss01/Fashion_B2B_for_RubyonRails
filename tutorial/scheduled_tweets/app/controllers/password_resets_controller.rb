class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            # Send mail
            # PasswordMailer.with(user: @user).reset.deliver_later # background로 처리
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password"
    end
end