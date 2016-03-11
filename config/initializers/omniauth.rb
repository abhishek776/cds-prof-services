OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

  if Rails.env.production?
    app_id = "175967292784758"
    app_secret = "d1b2280c7bf6bb831189b22014f79136"
  else  
    app_id = "175968132784674"
    app_secret = "af66c76beb1e0fd9393b9f8024da6dff"
  end

  provider :facebook, app_id, app_secret, {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
