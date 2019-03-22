class ClosetStation < ApplicationRecord
  belongs_to :property , optional: true
end
