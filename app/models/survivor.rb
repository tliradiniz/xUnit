class Survivor < ApplicationRecord

  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :last_location, presence: true, format: {with: /^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$/, :multiline => true}


end
