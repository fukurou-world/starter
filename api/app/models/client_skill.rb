class ClientSkill < ApplicationRecord
  belongs_to :client
  belongs_to :skill
end
