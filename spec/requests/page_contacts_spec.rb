require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/page_contacts", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # PageContact. As you add validations to PageContact, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      PageContact.create! valid_attributes
      get page_contacts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      page_contact = PageContact.create! valid_attributes
      get page_contact_url(page_contact)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_page_contact_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      page_contact = PageContact.create! valid_attributes
      get edit_page_contact_url(page_contact)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PageContact" do
        expect {
          post page_contacts_url, params: { page_contact: valid_attributes }
        }.to change(PageContact, :count).by(1)
      end

      it "redirects to the created page_contact" do
        post page_contacts_url, params: { page_contact: valid_attributes }
        expect(response).to redirect_to(page_contact_url(PageContact.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PageContact" do
        expect {
          post page_contacts_url, params: { page_contact: invalid_attributes }
        }.to change(PageContact, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post page_contacts_url, params: { page_contact: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested page_contact" do
        page_contact = PageContact.create! valid_attributes
        patch page_contact_url(page_contact), params: { page_contact: new_attributes }
        page_contact.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the page_contact" do
        page_contact = PageContact.create! valid_attributes
        patch page_contact_url(page_contact), params: { page_contact: new_attributes }
        page_contact.reload
        expect(response).to redirect_to(page_contact_url(page_contact))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        page_contact = PageContact.create! valid_attributes
        patch page_contact_url(page_contact), params: { page_contact: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested page_contact" do
      page_contact = PageContact.create! valid_attributes
      expect {
        delete page_contact_url(page_contact)
      }.to change(PageContact, :count).by(-1)
    end

    it "redirects to the page_contacts list" do
      page_contact = PageContact.create! valid_attributes
      delete page_contact_url(page_contact)
      expect(response).to redirect_to(page_contacts_url)
    end
  end
end
