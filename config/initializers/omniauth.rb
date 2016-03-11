OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '175967292784758', 'd1b2280c7bf6bb831189b22014f79136', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
