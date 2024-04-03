
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "html/pipeline/external_link/version"

Gem::Specification.new do |spec|
  spec.name          = "html-pipeline-external_link"
  spec.version       = HTMLPipeline::ExternalLink::VERSION
  spec.authors       = ["aki77"]
  spec.email         = ["aki77@users.noreply.github.com"]

  spec.summary       = %q{External link filter for html-pipeline.}
  spec.description   = %q{External link filter for html-pipeline.}
  spec.homepage      = "https://github.com/aki77/html-pipeline-external_link"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "addressable"
  spec.add_dependency "html-pipeline", "~> 3.0"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
