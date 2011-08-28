require 'spec_helper'

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

describe Customer::PlaygroundRequestsController do

  # This should return the minimal set of attributes required to create a valid
  # Customer::PlaygroundRequest. As you add validations to Customer::PlaygroundRequest, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all customer_playground_requests as @customer_playground_requests" do
      playground_request = Customer::PlaygroundRequest.create! valid_attributes
      get :index
      assigns(:customer_playground_requests).should eq([playground_request])
    end
  end

  describe "GET show" do
    it "assigns the requested playground_request as @playground_request" do
      playground_request = Customer::PlaygroundRequest.create! valid_attributes
      get :show, :id => playground_request.id.to_s
      assigns(:playground_request).should eq(playground_request)
    end
  end

  describe "GET new" do
    it "assigns a new playground_request as @playground_request" do
      get :new
      assigns(:playground_request).should be_a_new(Customer::PlaygroundRequest)
    end
  end

  describe "GET edit" do
    it "assigns the requested playground_request as @playground_request" do
      playground_request = Customer::PlaygroundRequest.create! valid_attributes
      get :edit, :id => playground_request.id.to_s
      assigns(:playground_request).should eq(playground_request)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Customer::PlaygroundRequest" do
        expect {
          post :create, :playground_request => valid_attributes
        }.to change(Customer::PlaygroundRequest, :count).by(1)
      end

      it "assigns a newly created playground_request as @playground_request" do
        post :create, :playground_request => valid_attributes
        assigns(:playground_request).should be_a(Customer::PlaygroundRequest)
        assigns(:playground_request).should be_persisted
      end

      it "redirects to the created playground_request" do
        post :create, :playground_request => valid_attributes
        response.should redirect_to(Customer::PlaygroundRequest.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved playground_request as @playground_request" do
        # Trigger the behavior that occurs when invalid params are submitted
        Customer::PlaygroundRequest.any_instance.stub(:save).and_return(false)
        post :create, :playground_request => {}
        assigns(:playground_request).should be_a_new(Customer::PlaygroundRequest)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Customer::PlaygroundRequest.any_instance.stub(:save).and_return(false)
        post :create, :playground_request => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested playground_request" do
        playground_request = Customer::PlaygroundRequest.create! valid_attributes
        # Assuming there are no other customer_playground_requests in the database, this
        # specifies that the Customer::PlaygroundRequest created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Customer::PlaygroundRequest.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => playground_request.id, :playground_request => {'these' => 'params'}
      end

      it "assigns the requested playground_request as @playground_request" do
        playground_request = Customer::PlaygroundRequest.create! valid_attributes
        put :update, :id => playground_request.id, :playground_request => valid_attributes
        assigns(:playground_request).should eq(playground_request)
      end

      it "redirects to the playground_request" do
        playground_request = Customer::PlaygroundRequest.create! valid_attributes
        put :update, :id => playground_request.id, :playground_request => valid_attributes
        response.should redirect_to(playground_request)
      end
    end

    describe "with invalid params" do
      it "assigns the playground_request as @playground_request" do
        playground_request = Customer::PlaygroundRequest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Customer::PlaygroundRequest.any_instance.stub(:save).and_return(false)
        put :update, :id => playground_request.id.to_s, :playground_request => {}
        assigns(:playground_request).should eq(playground_request)
      end

      it "re-renders the 'edit' template" do
        playground_request = Customer::PlaygroundRequest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Customer::PlaygroundRequest.any_instance.stub(:save).and_return(false)
        put :update, :id => playground_request.id.to_s, :playground_request => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested playground_request" do
      playground_request = Customer::PlaygroundRequest.create! valid_attributes
      expect {
        delete :destroy, :id => playground_request.id.to_s
      }.to change(Customer::PlaygroundRequest, :count).by(-1)
    end

    it "redirects to the customer_playground_requests list" do
      playground_request = Customer::PlaygroundRequest.create! valid_attributes
      delete :destroy, :id => playground_request.id.to_s
      response.should redirect_to(customer_playground_requests_url)
    end
  end

end
