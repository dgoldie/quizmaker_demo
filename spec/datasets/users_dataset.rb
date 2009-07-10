#
#
# in test/datasets/users_dataset.rb
#
class UsersDataset < Dataset::Base

  # hash and salt for password 'password'
  STUFF = {:password_hash => '3252d2eb62426c604de89906ad21f8c897fa2b89',
           :password_salt => '0fba728a73b0975078ebaa64badfc6d5f82d5a25' }

  def load
    create_user "curly"
    create_user "larry"
    create_user "moe"
    create_user "doug", { :email => "dgoldie@gmail.com"}
    create_user "dan", { :email => "dan@bikle.com"}
  end

  helpers do
    def create_user(name, attributes={})
      defaults = { :username => name, :email => name + "@stooges.com" }.merge(STUFF)
      create_record :user, name.downcase.intern, defaults.merge(attributes)
    end
  end
end
