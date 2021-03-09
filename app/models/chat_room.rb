# == Schema Information
#
# Table name: chat_rooms
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ChatRoom < ApplicationRecord
  has_many :chat_room_users
  has_many :chat_messages
  has_many :users, through: :chat_room_users
end
