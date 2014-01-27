require 'devise/strategies/database_authenticatable'

module Devise
  module Models
    module Inactivatable

      def active_for_authentication?
        active? && super
      end

      def inactivate!
        touch :inactivated_at
      end

      def activate!
        update_attribute :inactivated_at, nil
      end

      def active?
        !!inactivated_at
      end

      def inactive?
        !!inactivated_at
      end

      def inactive_message
        inactive? ? :inactivated : super
      end

    end
  end
end