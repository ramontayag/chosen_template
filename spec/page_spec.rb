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

  context 'when the template does not have a reference to the page' do
    # NOTE: One of the reasons this is useful: if you have a multitenant app,
    # split up by Site each having their own database or namespace. If there is
    # a SiteLayout model, but that model does not have a site_id (why should it
    # - Site lives on the public namespace).
    describe '#previewed_body_style' do
      it 'should go directly through BodyStyle class' do
        body_style = build_stubbed(:body_style)
        BodyStyle.stub_chain(:by_template_previewed_at, :first) { body_style }
        page.previewed_body_style.should == body_style
      end
    end

    describe '#published_body_style' do
      it 'should go directly through BodyStyle class' do
        body_style = build_stubbed(:body_style)
        BodyStyle.stub_chain(:by_template_published_at, :first) { body_style }
        page.published_body_style.should == body_style
      end
    end
  end

end
