class Application < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  enum :status, { pending: 0, accepted: 1, rejected: 2 }
end
