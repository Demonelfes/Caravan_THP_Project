class JoinVanTag < ApplicationRecord
  belongs_to :tag
  belongs_to :van
end
