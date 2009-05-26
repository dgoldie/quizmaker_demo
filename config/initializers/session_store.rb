# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_quizmaker_demo_session',
  :secret      => '7fb63fc7636f903a49f94101411f77ab0ebbd7f996655e51e969dfe22d97c246384b53b0eaaf3da39504d46de9662981234d86885a5abdc7ccbba3f1adb00792'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
