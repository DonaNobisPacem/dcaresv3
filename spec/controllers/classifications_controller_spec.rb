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

RSpec.describe ClassificationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Classification. As you add validations to Classification, be sure to
  # adjust the attributes here as well.
  before(:each) do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end
  
  let(:valid_attributes) {
    {
      description: "Classification 1"
    }
  }

  let(:invalid_attributes) {
    {
      description: ""
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClassificationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all classifications as @classifications" do
      classification = Classification.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:classifications)).to eq([classification])
    end
  end

  describe "GET #show" do
    it "assigns the requested classification as @classification" do
      classification = Classification.create! valid_attributes
      get :show, {:id => classification.to_param}, valid_session
      expect(assigns(:classification)).to eq(classification)
    end
  end

  describe "GET #new" do
    it "assigns a new classification as @classification" do
      get :new, {}, valid_session
      expect(assigns(:classification)).to be_a_new(Classification)
    end
  end

  describe "GET #edit" do
    it "assigns the requested classification as @classification" do
      classification = Classification.create! valid_attributes
      get :edit, {:id => classification.to_param}, valid_session
      expect(assigns(:classification)).to eq(classification)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Classification" do
        expect {
          post :create, {:classification => valid_attributes}, valid_session
        }.to change(Classification, :count).by(1)
      end

      it "assigns a newly created classification as @classification" do
        post :create, {:classification => valid_attributes}, valid_session
        expect(assigns(:classification)).to be_a(Classification)
        expect(assigns(:classification)).to be_persisted
      end

      it "redirects to the classification index" do
        post :create, {:classification => valid_attributes}, valid_session
        expect(response).to redirect_to(classifications_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved classification as @classification" do
        post :create, {:classification => invalid_attributes}, valid_session
        expect(assigns(:classification)).to be_a_new(Classification)
      end

      it "re-renders the 'new' template" do
        post :create, {:classification => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          description: "Classification 2"
        }
      }

      it "updates the requested classification" do
        classification = Classification.create! valid_attributes
        put :update, {:id => classification.to_param, :classification => new_attributes}, valid_session
        classification.reload
        expect(assigns(:classification).description).to eq(new_attributes[:description])
      end

      it "assigns the requested classification as @classification" do
        classification = Classification.create! valid_attributes
        put :update, {:id => classification.to_param, :classification => valid_attributes}, valid_session
        expect(assigns(:classification)).to eq(classification)
      end

      it "redirects to the classification index" do
        classification = Classification.create! valid_attributes
        put :update, {:id => classification.to_param, :classification => valid_attributes}, valid_session
        expect(response).to redirect_to(classifications_path)
      end
    end

    context "with invalid params" do
      it "assigns the classification as @classification" do
        classification = Classification.create! valid_attributes
        put :update, {:id => classification.to_param, :classification => invalid_attributes}, valid_session
        expect(assigns(:classification)).to eq(classification)
      end

      it "re-renders the 'edit' template" do
        classification = Classification.create! valid_attributes
        put :update, {:id => classification.to_param, :classification => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested classification" do
      classification = Classification.create! valid_attributes
      expect {
        delete :destroy, {:id => classification.to_param}, valid_session
      }.to change(Classification, :count).by(-1)
    end

    it "redirects to the classifications list" do
      classification = Classification.create! valid_attributes
      delete :destroy, {:id => classification.to_param}, valid_session
      expect(response).to redirect_to(classifications_url)
    end
  end

end
