class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true

    def self.find_or_create_from_auth_hash(auth_hash)
        if user = User.find_by(:email => auth_hash[:info][:email])
            @user = user
        else
            @user = User.new(
                :email => auth_hash[:info][:email],
                :name => auth_hash[:info][:name],
                :provider => auth_hash[:provider]
            )
            @user.save
        end

        @user
    end
end
