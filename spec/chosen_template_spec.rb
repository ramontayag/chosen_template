require 'spec_helper'

describe ChosenTemplate do
  it 'should allow the chooser to preview', integration: true do
  end

  it 'should allow the chooser to publish', integration: true do
  end

  describe '.choosable_template' do
    context 'when the model does not have the template_previewed_at field' do
      it 'should raise an exception' do
        expect { Page.choosable_template }.to raise_error(ArgumentError)
      end
    end

    context 'when the model does not have the template_published_at field' do
      it 'should raise an exception' do
        expect { Page.choosable_template }.to raise_error(ArgumentError)
      end
    end
  end
end
