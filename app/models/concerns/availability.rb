module Availability
  extend ActiveSupport::Concern

  included do
    scope :available, -> { where(available: true) }
    scope :unavailable, -> { where(available: [false, nil]) }

    defaults available: true
  end
end
