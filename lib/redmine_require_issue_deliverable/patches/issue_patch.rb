module RedmineRequireIssueDeliverable
  module Patches
    module IssuePatch

      def self.included(base)
        base.class_eval do
          unloadable

          validates_presence_of :deliverable_id, :if => :budget_module_enabled_on_project?

          protected

          def budget_module_enabled_on_project?
            project && project.module_enabled?(:budget_module)
          end
          
        end
      end
    end
  end
end
