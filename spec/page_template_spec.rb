require 'spec_helper'

describe PageTemplate do

  describe '.published_templates' do
    it 'should return the published models' do
      described_class.published_templates.to_sql.should ==
        %Q(SELECT "#{described_class.table_name}".* FROM "#{described_class.table_name}"  WHERE (#{described_class.table_name}.template_published_at IS NOT NULL))
    end
  end

  describe '.by_template_published_at' do
    it 'should order the published models by template_published_at' do
      described_class.by_template_published_at.to_sql.should ==
        %Q(SELECT "#{described_class.table_name}".* FROM "#{described_class.table_name}"  WHERE (#{described_class.table_name}.template_published_at IS NOT NULL) ORDER BY #{described_class.table_name}.template_published_at DESC)
    end
  end

  describe '.previewed_templates' do
    it 'should return the preview models' do
      described_class.previewed_templates.to_sql.should ==
        %Q(SELECT "#{described_class.table_name}".* FROM "#{described_class.table_name}"  WHERE (#{described_class.table_name}.template_previewed_at IS NOT NULL))
    end
  end

  describe '.by_template_previewed_at' do
    it 'should order the previewed models by template_previewed_at' do
      described_class.by_template_previewed_at.to_sql.should ==
        %Q(SELECT "#{described_class.table_name}".* FROM "#{described_class.table_name}"  WHERE (#{described_class.table_name}.template_previewed_at IS NOT NULL) ORDER BY #{described_class.table_name}.template_previewed_at DESC)
    end
  end

  describe '#previewed_template?' do
    context 'page is the latest marked as previewed' do
      it 'should be true' do
        style = build_stubbed(:page_template)
        another_style = build_stubbed(:page_template)
        described_class.stub(:by_template_previewed_at) { [style, another_style] }
        style.should be_previewed_template
      end
    end

    context 'style is not the latest previewed' do
      it 'should be true' do
        another_style = build_stubbed(:page_template)
        style = build_stubbed(:page_template)
        described_class.stub(:by_template_previewed_at) { [another_style, style] }
        style.should_not be_previewed_template
      end
    end
  end

  describe '#preview_template!' do
    it 'should update the template_previewed_at column' do
      Timecop.freeze 2.minutes.ago
      style = build_stubbed(:page_template)
      style.should_receive(:update_attributes).
        with(template_previewed_at: Time.now)
      style.preview_template!
    end
  end

  describe '#published_template?' do
    context 'style is the latest marked as published' do
      it 'should be true' do
        style = build_stubbed(:page_template)
        another_style = build_stubbed(:page_template)
        described_class.stub(:by_template_published_at) { [style, another_style] }
        style.should be_published_template
      end
    end

    context 'style is not the latest published' do
      it 'should be true' do
        another_style = build_stubbed(:page_template)
        style = build_stubbed(:page_template)
        described_class.stub(:by_template_published_at) { [another_style, style] }
        style.should_not be_published_template
      end
    end
  end

  describe '#publish_template!' do
    it 'should update the previewed_at column' do
      Timecop.freeze 2.minutes.ago
      style = build_stubbed(:page_template)
      style.should_receive(:update_attributes).
        with(template_published_at: Time.now)
      style.publish_template!
    end
  end

end
