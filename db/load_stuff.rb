# To change this template, choose Tools | Templates
# and open the template in the editor.

puts "Load user data..."
hash = '3252d2eb62426c604de89906ad21f8c897fa2b89'
salt = '0fba728a73b0975078ebaa64badfc6d5f82d5a25'

ret = User.delete_all
puts "> all users deleted, #{ret}"
names = %w(moe curly larry)
names.each do |name|
  user = User.new(:username => name,
                      :email => "#{name}@stooges.com",
                      :password_hash => hash,
                      :password_salt => salt)
  user.save(false)
  puts "> #{name}'s user created = #{user.valid?}"
end
users = User.find :all

puts "Load quiz data..."
str = <<EOF
What is your favorite color?
What is your pet's name?
EOF

puts str




puts "users created = #{users.size}"