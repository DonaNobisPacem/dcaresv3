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

RSpec.describe ProjectFundsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ProjectFund. As you add validations to ProjectFund, be sure to
  # adjust the attributes here as well.
  before(:each) do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    @project = FactoryGirl.create(:project)
  end

  let(:valid_attributes) {
    {
      source: 1,
      amount: "9.99",
      project_id: @project.id
    }
  }

  let(:invalid_attributes) {
    {
      source: nil,
      amount: "9.99",
      project_id: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectFundsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all project_funds as @project_funds" do
      project_fund = ProjectFund.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:project_funds)).to eq([project_fund])
    end
  end

  describe "GET #show" do
    it "assigns the requested project_fund as @project_fund" do
      project_fund = ProjectFund.create! valid_attributes
      get :show, {:id => project_fund.to_param}, valid_session
      expect(assigns(:project_fund)).to eq(project_fund)
    end
  end

  describe "GET #new" do
    it "assigns a new project_fund as @project_fund" do
      get :new, {}, valid_session
      expect(assigns(:project_fund)).to be_a_new(ProjectFund)
    end
  end

  describe "GET #edit" do
    it "assigns the requested project_fund as @project_fund" do
      project_fund = ProjectFund.create! valid_attributes
      get :edit, {:id => project_fund.to_param}, valid_session
      expect(assigns(:project_fund)).to eq(project_fund)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ProjectFund" do
        expect {
          post :create, {:project_fund => valid_attributes}, valid_session
        }.to change(ProjectFund, :count).by(1)
      end

      it "assigns a newly created project_fund as @project_fund" do
        post :create, {:project_fund => valid_attributes}, valid_session
        expect(assigns(:project_fund)).to be_a(ProjectFund)
        expect(assigns(:project_fund)).to be_persisted
      end

      it "redirects to the created project_fund" do
        post :create, {:project_fund => valid_attributes}, valid_session
        expect(response).to redirect_to(ProjectFund.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved project_fund as @project_fund" do
        post :create, {:project_fund => invalid_attributes}, valid_session
        expect(assigns(:project_fund)).to be_a_new(ProjectFund)
      end

      it "re-renders the 'new' template" do
        post :create, {:project_fund => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          source: 2,
          amount: "9.99",
          project_id: @project.id
        }
      }

      it "updates the requested project_fund" do
        project_fund = ProjectFund.create! valid_attributes
        put :update, {:id => project_fund.to_param, :project_fund => new_attributes}, valid_session
        project_fund.reload
        expect(assigns(:project_fund).source).to eq(new_attributes[:source])
      end

      it "assigns the requested project_fund as @project_fund" do
        project_fund = ProjectFund.create! valid_attributes
        put :update, {:id => project_fund.to_param, :project_fund => valid_attributes}, valid_session
        expect(assigns(:project_fund)).to eq(project_fund)
      end

      it "redirects to the project_fund" do
        project_fund = ProjectFund.create! valid_attributes
        put :update, {:id => project_fund.to_param, :project_fund => valid_attributes}, valid_session
        expect(response).to redirect_to(project_fund)
      end
    end

    context "with invalid params" do
      it "assigns the project_fund as @project_fund" do
        project_fund = ProjectFund.create! valid_attributes
        put :update, {:id => project_fund.to_param, :project_fund => invalid_attributes}, valid_session
        expect(assigns(:project_fund)).to eq(project_fund)
      end

      it "re-renders the 'edit' template" do
        project_fund = ProjectFund.create! valid_attributes
        put :update, {:id => project_fund.to_param, :project_fund => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project_fund" do
      project_fund = ProjectFund.create! valid_attributes
      expect {
        delete :destroy, {:id => project_fund.to_param}, valid_session
      }.to change(ProjectFund, :count).by(-1)
    end

    it "redirects to the project_funds list" do
      project_fund = ProjectFund.create! valid_attributes
      delete :destroy, {:id => project_fund.to_param}, valid_session
      expect(response).to redirect_to(project_funds_url)
    end
  end

end
