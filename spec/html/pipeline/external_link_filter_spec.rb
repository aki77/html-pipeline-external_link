RSpec.describe HTML::Pipeline::ExternalLinkFilter do
  context 'no context' do
    it 'raise error' do
      expect { HTML::Pipeline::ExternalLinkFilter.new('dummy') }.to raise_error(/Missing context keys/)
    end
  end

  context 'same host' do
    subject { HTML::Pipeline::ExternalLinkFilter.new(text, hostname: 'google.com').call.to_s }
    let(:text) { '<a href="https://google.com/">https://google.com/</a>' }

    it { is_expected.to eq '<a href="https://google.com/">https://google.com/</a>' }
  end

  context 'other host' do
    subject { HTML::Pipeline::ExternalLinkFilter.new(text, hostname: 'yahoo.com').call.to_s }
    let(:text) { '<a href="https://google.com/">https://google.com/</a>' }

    it { is_expected.to eq '<a href="https://google.com/" rel="nofollow noopener" target="_blank">https://google.com/</a>' }
  end
end
