class MessagesController < ApplicationController
  helper_method :chat

  def create
    message_content = params[:content]

    # Queue the background job to handle the streaming response
    ChatStreamJob.perform_later(chat.id, message_content)

    # Immediately return success to the user
    respond_to do |format|
      format.turbo_stream { head :ok }
      format.html { redirect_to chat }
    end
  end

  private

  def chat
    @chat ||= User.first.chat
  end
end