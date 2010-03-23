module RedmineRequireIssueDeliverable
  module Patches
    module IssuePatch

      def self.included(base)
        base.class_eval do
          unloadable
        end
      end
    end
  end
end
