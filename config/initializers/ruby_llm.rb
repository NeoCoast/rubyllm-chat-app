RubyLLM.configure do |config|
  config.gemini_api_key = Rails.application.credentials.gemini_api_key
  config.openai_api_key = Rails.application.credentials.openai_api_key
  config.anthropic_api_key = Rails.application.credentials.anthropic_api_key
  config.default_model = "gemini-2.0-flash"
end
