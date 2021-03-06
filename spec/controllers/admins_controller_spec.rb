require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe AdminsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Admin. As you add validations to Admin, be sure to
  # adjust the attributes here as well.

  context "when user Admin" do

    login_admin

    let (:admin) { create(:admin) }
    let(:valid_attributes) { attributes_for(:admin) }
    let(:invalid_attributes) { attributes_for(:admin, email: "", password: "") }
    let(:valid_session) { {} }

    describe "GET #index" do
      it "redirects to sign in page" do
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to new_admin_session_url
      end
    end

    describe "GET #show" do
      it "assigns the requested admin as @admin" do
        get :show, params: {id: admin.to_param}, session: valid_session
        expect(assigns(:admin)).to eq(admin)
      end
    end

    describe "GET #new" do
      it "redirects to sign in" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end

    describe "GET #edit" do
      context "correct admin" do
        it "assigns the requested admin as @admin" do
          get :edit, params: {id: @logged_admin.to_param}, session: valid_session
          expect(assigns(:admin)).to eq(@logged_admin)
        end
      end
      context "incorrect admin" do
        it "redirects to sign in path" do
          get :edit, params: {id: admin.to_param}, session: valid_session
          expect(response).to redirect_to new_admin_session_url
        end
      end
    end

    describe "POST #create" do
      it "redirects to sign in" do
        post :create, params: {admin: valid_attributes}, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) { attributes_for(:admin) }

        it "updates the requested admin" do
          put :update, params: {id: @logged_admin.to_param, admin: new_attributes}, session: valid_session
          @logged_admin.reload
          expect(@logged_admin.email).to eq new_attributes[:email]
        end

        it "assigns the requested admin as @admin" do
          put :update, params: {id: @logged_admin.to_param, admin: valid_attributes}, session: valid_session
          expect(assigns(:admin)).to eq(@logged_admin)
        end

        it "redirects to the admin" do
          put :update, params: {id: @logged_admin.to_param, admin: valid_attributes}, session: valid_session
          expect(response).to redirect_to(@logged_admin)
        end
      end

      context "with invalid params" do
        it "assigns the admin as @admin" do
          put :update, params: {id: @logged_admin.to_param, admin: invalid_attributes}, session: valid_session
          expect(assigns(:admin)).to eq(@logged_admin)
        end

        it "re-renders the 'edit' template" do
          put :update, params: {id: @logged_admin.to_param, admin: invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
      context "when not correct user" do
        it "redirects to sign in" do
          put :update, params: {id: admin.to_param, admin: valid_attributes}, session: valid_session
          expect(response).to redirect_to new_admin_session_path
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested admin" do
        expect {
          delete :destroy, params: {id: @logged_admin.to_param}, session: valid_session
        }.to change(Admin, :count).by(-1)
      end

      it "redirects to the admins list" do
        delete :destroy, params: {id: @logged_admin.to_param}, session: valid_session
        expect(response).to redirect_to(admins_url)
      end

      context "when not correct user" do
        it "redirects to sign in" do
          delete :destroy, params: {id: admin.to_param}, session: valid_session
          expect(response).to redirect_to new_admin_session_path
        end
      end
    end
  end

  context "when user Super Admin" do

    login_super_admin

    let (:admin){ create(:admin) }

    let(:valid_attributes) { attributes_for(:admin) }

    let(:invalid_attributes) { attributes_for(:admin, email: "", password: "") }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # AdminsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET #index" do
      it "assigns all admins as @admins" do
        get :index, params: {}, session: valid_session
        expect(assigns(:admins)).to eq([@super_admin, admin])
      end
    end

    describe "GET #show" do
      it "assigns the requested admin as @admin" do
        get :show, params: {id: admin.to_param}, session: valid_session
        expect(assigns(:admin)).to eq(admin)
      end
    end

    describe "GET #new" do
      it "assigns a new admin as @admin" do
        get :new, params: {}, session: valid_session
        expect(assigns(:admin)).to be_a_new(Admin)
      end
    end

    describe "GET #edit" do
      it "assigns the requested admin as @admin" do
        get :edit, params: {id: admin.to_param}, session: valid_session
        expect(assigns(:admin)).to eq(admin)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Admin" do
          expect {
            post :create, params: {admin: valid_attributes}, session: valid_session
          }.to change(Admin, :count).by(1)
        end

        it "assigns a newly created admin as @admin" do
          post :create, params: {admin: valid_attributes}, session: valid_session
          expect(assigns(:admin)).to be_a(Admin)
          expect(assigns(:admin)).to be_persisted
        end

        it "redirects to the created admin" do
          post :create, params: {admin: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Admin.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved admin as @admin" do
          post :create, params: {admin: invalid_attributes}, session: valid_session
          expect(assigns(:admin)).to be_a_new(Admin)
        end

        it "re-renders the 'new' template" do
          post :create, params: {admin: invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          valid_attributes
        }

        it "updates the requested admin" do
          put :update, params: {id: admin.to_param, admin: new_attributes}, session: valid_session
          admin.reload
          expect(admin.email).to eq new_attributes[:email]
        end

        it "assigns the requested admin as @admin" do
          put :update, params: {id: admin.to_param, admin: valid_attributes}, session: valid_session
          expect(assigns(:admin)).to eq(admin)
        end

        it "redirects to the admin" do
          put :update, params: {id: admin.to_param, admin: valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin)
        end
      end

      context "with invalid params" do
        it "assigns the admin as @admin" do
          put :update, params: {id: admin.to_param, admin: invalid_attributes}, session: valid_session
          expect(assigns(:admin)).to eq(admin)
        end

        it "re-renders the 'edit' template" do
          put :update, params: {id: admin.to_param, admin: invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested admin" do
        admin = create(:admin)
        expect {
          delete :destroy, params: {id: admin.to_param}, session: valid_session
        }.to change(Admin, :count).by(-1)
      end

      it "redirects to the admins list" do
        admin = create(:admin)
        delete :destroy, params: {id: admin.to_param}, session: valid_session
        expect(response).to redirect_to(admins_url)
      end
    end
  end
end
