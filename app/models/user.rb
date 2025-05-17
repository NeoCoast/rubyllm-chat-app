class User < ApplicationRecord
  has_one :chat, dependent: :destroy
end
