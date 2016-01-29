require 'spec_helper'
# si = "Sign In"
# so = "Sign Out"

describe "Authentication" do
  include SampleApp::Application.routes.url_helpers
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_title(si) }
    it { should have_content(si) }

    describe "with invalid information" do
      before { click_button "Sign In" }

      it { should have_title(si) }
      it { should have_error_message }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_error_message('Invalid') } #have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) {FactoryGirl.create(:user) }
      before { valid_signin(user) }

      it { should have_title(user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link(so, href: signout_path) }
      it { should_not have_link(si, href: signin_path) }

      describe "followed by signout" do
        before { click_link so }
        it { should have_link(si) }
      end
    end
  end
end
