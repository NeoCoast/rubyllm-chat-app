class ChatsController < ApplicationController
  helper_method :user, :chat, :welcome_message

  def show
    
  end

  private
  
  def user
    @user ||= User.first
  end

  def chat
    @chat ||= user.chat || user.create_chat
  end

  def welcome_message
    RubyLLM.chat.ask("Write a welcome message for user #{user.name}. Only return one sentence. Should be polite and friendly.").content
  end
end
