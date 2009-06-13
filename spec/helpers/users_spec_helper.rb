module UsersSpecHelper

  def valid_user_attributes
    { :username => 'joseph',
      :email => 'joseph@widget.com',
      :password => 'password',
      :password_confirmation => 'password'
    }
  end
  
end