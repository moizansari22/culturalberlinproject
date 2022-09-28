class Event < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :teaser
  validates_presence_of :bar
end
