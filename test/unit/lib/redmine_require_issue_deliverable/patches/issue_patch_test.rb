require File.dirname(__FILE__) + '/../../../../test_helper'

class RedmineRequireIssueDeliverable::Patches::IssuePatchTest < ActiveSupport::TestCase
  context "Issue" do
    setup do
      @project = Project.create!(:name => 'IssueTest', :identifier => 'issue-test')
      @issue = Issue.new(:project_id => @project.id)
    end

    subject { @issue }

    context "on a project with the budget plugin enabled" do
      setup do
        @project.enabled_module_names = [:budget_module]
        assert @project.module_enabled?(:budget_module)
      end
      
      should_validate_presence_of :deliverable_id
    end

    context "on a project with the budget plugin disabled" do
      setup do
        assert !@project.module_enabled?(:budget_module)
      end

      should "not require deliverable_id to be set" do
        assert_equal nil, @issue.deliverable_id
        assert_equal nil, @issue.deliverable

        @issue.valid?

        assert_equal nil, @issue.errors.on(:deliverable_id)
        assert_equal nil, @issue.errors.on(:deliverable)
      end
    end
  end
end
