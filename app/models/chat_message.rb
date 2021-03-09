# == Schema Information
#
# Table name: chat_messages
#
#  id           :bigint           not null, primary key
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chat_room_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_chat_messages_on_chat_room_id  (chat_room_id)
#  index_chat_messages_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chat_room_id => chat_rooms.id)
#  fk_rails_...  (user_id => users.id)
#
class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  after_create_commit { ChatMessageBroadcastJob.perform_later self }
end
