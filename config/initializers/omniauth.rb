OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

  if Rails.env.production?
    app_id = "175967292784758"
    app_secret = "d1b2280c7bf6bb831189b22014f79136"
  else  
    app_id = "176654776049343"
    app_secret = "bc5088f8e4c76d6f6b1d710cd13406fe"
  end

  provider :facebook, app_id, app_secret, {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
