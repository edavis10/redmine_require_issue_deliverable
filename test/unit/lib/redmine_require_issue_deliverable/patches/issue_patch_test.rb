require File.dirname(__FILE__) + '/../../../../test_helper'

class RedmineRequireIssueDeliverable::Patches::IssuePatchTest < ActiveSupport::TestCase
  context "Issue" do
    subject { Issue.new }
  end
end
