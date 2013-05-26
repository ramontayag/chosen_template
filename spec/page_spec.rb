require 'spec_helper'

describe Page do
  let(:page) { build_stubbed(:page) }

  describe '#previewed_page_template' do
    it 'should return the chosen previewed page template' do
      page_template = build_stubbed(:page_template)
      page.stub_chain(:page_templates, :by_template_previewed_at, :first) {
        page_template
      }
      page.previewed_page_template.should == page_template
    end
  end

  describe '#published_page_template' do
    it 'should return the chosen published page template' do
      page_template = build_stubbed(:page_template)
      page.stub_chain(:page_templates, :by_template_published_at, :first) {
        page_template
      }
      page.published_page_template.should == page_template
    end
  end

  describe '#previewed_style' do
    it 'should return the chosen previewed page template' do
      style = build_stubbed(:style)
      page.stub_chain(:styles, :by_template_previewed_at, :first) {
        style
      }
      page.previewed_style.should == style
    end
  end

  describe '#published_style' do
    it 'should return the chosen style' do
      style = build_stubbed(:style)
      page.stub_chain(:styles, :by_template_published_at, :first) {
        style
      }
      page.published_style.should == style
    end
  end

end
