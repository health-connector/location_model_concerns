require 'active_support/concern'

module OfficeLocationConcern
  extend ActiveSupport::Concern
  
  included do
    include Mongoid::Document
  
    field :is_primary, type: Boolean, default: true
    alias_method :is_primary?, :is_primary

    embeds_one :address, cascade_callbacks: true, validate: true
    embeds_one :phone, cascade_callbacks: true, validate: true

    accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true    
    accepts_nested_attributes_for :phone, reject_if: :all_blank, allow_destroy: true

    validates_presence_of :phone, if: :primary_or_branch?
    validates_presence_of :address
    validate :address_includes_county_for_employers_primary_location

    def primary_or_branch?
      ['primary', 'branch'].include? address.kind if address.present?
    end

    # TODO -- only one office location can be primary
    # def is_primary=(new_primary_value)
    #   if parent.present? && new_primary_value == true
    #     parent.office_locations.each { |loc| loc.is_primary == false unless loc == self }
    #   end
    # end
  end
  
  class_methods do
    
  end
end
  