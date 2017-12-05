require 'active_support/concern'

module GeographicRatingAreaConcern
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    include Mongoid::Timestamps
    # An area that all issuers in the state must uniformly use as part of their rate setting
    # Rating areas are made up of counties, metroplitan statistical areas or 3 digit zip codes
    # Default areas are Metropolitan Statistical Areas (MSAs) plus the remainder of the state
    # not included in a MSA
    # Example: http://insuremekevin.com/california-navigator/covered-california-regions-plans/

    field :rating_area_code, type: String

    has_many :us_counties

  end

  class_methods do

  end
end
