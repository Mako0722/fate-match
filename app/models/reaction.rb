# == Schema Information
#
# Table name: reactions
#
#  id           :bigint           not null, primary key
#  status       :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  from_user_id :bigint           not null
#  to_user_id   :bigint           not null
#
# Indexes
#
#  index_reactions_on_from_user_id  (from_user_id)
#  index_reactions_on_to_user_id    (to_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (from_user_id => users.id)
#  fk_rails_...  (to_user_id => users.id)
#
class Reaction < ApplicationRecord
  belongs_to :to_user, class_name: "User"
  belongs_to :from_user, class_name: "User"

  enum status: { like: 0, dislike: 1 }
end
