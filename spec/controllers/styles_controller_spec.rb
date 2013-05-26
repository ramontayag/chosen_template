require 'spec_helper'

describe StylesController, type: :controller do

  describe 'PUT #preview_template' do
    it 'should update the style#template_previewed_at to now' do
      Timecop.freeze
      style = build_stubbed(:style)
      Style.stub(:find).with(style.id.to_s) { style }
      style.should_receive(:update_attributes).
        with(template_previewed_at: Time.now)
      location = "http:://somewhereelse.com"
      put :preview_template, id: style.id, location: location
      response.should redirect_to(location)
    end
  end

  describe 'PUT #publish_template' do
    it 'should update the style#template_published_at to now' do
      Timecop.freeze
      style = build_stubbed(:style)
      Style.stub(:find).with(style.id.to_s) { style }
      style.should_receive(:update_attributes).
        with(template_published_at: Time.now)
      location = "http:://somewhereelse.com"
      put :publish_template, id: style.id, location: location
      response.should redirect_to(location)
    end
  end

end
