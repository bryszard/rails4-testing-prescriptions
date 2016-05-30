require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  before(:example) do
    sign_in User.create! email: 'rspec@example.com', password: 'password'
  end

  describe 'POST create' do 
    it 'creates a project' do
      post :create, project: {name: 'Runway', tasks: 'Start something:2'}
      expect(response).to redirect_to(projects_path)
      expect(assigns(:action).project.name).to eq('Runway')
    end
    
    it 'goes back to the form failure' do 
      post :create, project: { name: '', tasks: '' }
      expect(response).to render_template(:new)
      expect(assigns(:project)).to be_present
    end
  end
  
end
