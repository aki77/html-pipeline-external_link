RSpec.describe HTMLPipeline::ExternalLinkFilter do
  context 'no context' do
    it 'raise error' do
      expect { HTMLPipeline::ExternalLinkFilter.call('<a href="https://google.com/">https://google.com/</a>') }.to raise_error(/Missing context :hostname/)
    end
  end

  context 'same host' do
    subject { HTMLPipeline::ExternalLinkFilter.call(text, context: { hostname: 'google.com' }).to_s }
    let(:text) { '<a href="https://google.com/">https://google.com/</a>' }

    it { is_expected.to eq '<a href="https://google.com/">https://google.com/</a>' }
  end

  context 'other host' do
    subject { HTMLPipeline::ExternalLinkFilter.call(text, context: { hostname: 'yahoo.com' }).to_s }
    let(:text) { '<a href="https://google.com/">https://google.com/</a>' }

    it { is_expected.to eq '<a href="https://google.com/" rel="nofollow noopener" target="_blank">https://google.com/</a>' }
  end
end
