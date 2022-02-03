# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe 'POST create course' do
    it 'expect course to be created' do
      params = {
        course: {
          name: 'Programming',
          tutors_attributes: [{
            name: 'tutor1'
          }, {
            name: 'tutor2'
          }]
        }
      }
      post :create, params: params
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['name']).to eq('Programming')
    end

    it 'expect course to be created and not tutor data' do
      params = {
        course: {
          name: 'Programming',
          tutors: [{
            name: 'nil'
          }]
        }
      }
      post :create, params: params
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['name']).to eq('Programming')
    end

    it 'expect course not to be created' do
      Course.create(name: 'Programming')
      params = {
        course: {
          name: 'Programming',
          tutors: [{
            name: 'nil'
          }]
        }
      }
      post :create, params: params
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['errors'][0]).to eq('Name Course already exists!')
    end
  end

  describe 'GET index' do
    it 'return all courses with their tutors' do
      @course = Course.create(
          name: 'Programming',
          tutors_attributes: [{
            name: 'tutor1'
          }, {
            name: 'tutor2'
          }]
        )

      get :index

      expect(JSON.parse(response.body).length).to eq(1)
      expect(response).to have_http_status(:ok)
    end

    it 'expect no courses' do
      get :index
      expect(JSON.parse(response.body).length).to eq(0)
      expect(response).to have_http_status(:ok)
    end
  end

end
