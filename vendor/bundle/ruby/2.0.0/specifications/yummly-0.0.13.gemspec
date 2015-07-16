# -*- encoding: utf-8 -*-
# stub: yummly 0.0.13 ruby lib

Gem::Specification.new do |s|
  s.name = "yummly"
  s.version = "0.0.13"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Theo Mills"]
  s.date = "2013-12-11"
  s.description = "Ruby wrapper to the Yummly API"
  s.email = ["twmills@twmills.com"]
  s.homepage = "https://github.com/twmills/yummly"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "This is the unofficial ruby wrapper to the Yummly API, \"the world's largest and most powerful recipe search site\""

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, [">= 0.8.7"])
      s.add_runtime_dependency(%q<rack>, [">= 1.4.5"])
      s.add_runtime_dependency(%q<json>, ["~> 1.8.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<faraday>, [">= 0.8.7"])
      s.add_dependency(%q<rack>, [">= 1.4.5"])
      s.add_dependency(%q<json>, ["~> 1.8.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<faraday>, [">= 0.8.7"])
    s.add_dependency(%q<rack>, [">= 1.4.5"])
    s.add_dependency(%q<json>, ["~> 1.8.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
