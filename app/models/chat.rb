class Chat < ApplicationRecord
  acts_as_chat

  belongs_to :user

  broadcasts_to ->(chat) { [chat, "messages"] }
end
