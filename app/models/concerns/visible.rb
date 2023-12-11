# frozen_string_literal: true

# a module to define what is allowed to be showed to everyone
module Visible
  extend ActiveSupport::Concern
  VALID_STATUSES = %w[public private archived].freeze
  included do
    validates :status, inclusion: { in: VALID_STATUSES }, presence: true, length: { minimum: 6 }
  end
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end
  def archived?
    status == 'archived'
  end
end
