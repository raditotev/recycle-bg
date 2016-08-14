module ControllerHelperMethods
  def login_super_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:super_admin]
      @super_admin = FactoryGirl.create(:super_admin)
      sign_in @super_admin
    end
  end

    def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @logged_admin = FactoryGirl.create(:admin)
      sign_in @logged_admin
    end
  end
end
