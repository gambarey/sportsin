class Achievement < ApplicationRecord
  belongs_to :user
  enum sort: { title: "title", honor: "honor" }
end
