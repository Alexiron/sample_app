require 'spec_helper'

describe "UserPages" do
  include SampleApp::Application.routes.url_helpers
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign Up') }
    it { should have_title(full_title('Sign Up')) }
  end
end
