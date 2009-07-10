require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.name  { Faker::Name.name }
Sham.email { Faker::Internet.email }
Sham.title { Faker::Lorem.sentence }
Sham.body  { Faker::Lorem.paragraph }


User.blueprint do
  name  { Sham.name }
  email { Faker::Internet.email }
  password
end

Quiz.blueprint do
  name

end

Question.blueprint do
  question_text
  author_name  { Sham.name }
  author_email { Sham.email }
  body
end

