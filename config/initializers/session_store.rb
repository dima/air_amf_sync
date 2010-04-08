# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_air_amf_sync_session',
  :secret      => '690f868b7852483f97eb21755be435d0d72a996e7ebfdcc2f5a6e6866d4bb7d74905b10ceb171db5b943606e4d2f46686d57408e968be71ef499188d3e2ecf64'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
