require 'html_pipeline'
require "addressable/uri"

# SEE: https://github.com/increments/qiita-markdown/blob/master/lib/qiita/markdown/filters/external_link.rb
class HTMLPipeline
  class ExternalLinkFilter < NodeFilter
    SELECTOR = Selma::Selector.new(match_element: %(a[href^="http"]))

    def selector
      SELECTOR
    end

    def handle_element(element)
      return unless element["href"]

      href = element["href"].strip
      href_host = host_of(href)
      return unless href_host

      if href_host != hostname
        element["rel"] = "nofollow noopener"
        element["target"] = "_blank"
      end
    end

    private

    def host_of(url)
      uri = Addressable::URI.parse(url)
      uri.host
    rescue Addressable::URI::InvalidURIError
      nil
    end

    def hostname
      context[:hostname] || raise("Missing context :hostname for #{self.class.name}")
    end
  end
end
