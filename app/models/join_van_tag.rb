class JoinVanTag < ApplicationRecord
  validates :tag_id, presence: true
  validates :van_id, presence: true

  belongs_to :tag
  belongs_to :van
end
