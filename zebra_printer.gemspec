# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: zebra_printer 0.4.3 ruby lib

Gem::Specification.new do |s|
  s.name = "zebra_printer".freeze
  s.version = "0.4.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Paul Mitchell".freeze]
  s.date = "2018-02-07"
  s.description = "This DSL is for zebra printers and support languages ZPLII and EPLII".freeze
  s.email = "paul.d.mitchell@ed.ac.uk".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "features/ascii-text-font.feature",
    "features/ascii-text-rotation.feature",
    "features/ascii-text-simple.feature",
    "features/ascii-text-size.feature",
    "features/barcode-code128.feature",
    "features/barcode-datamatrix.feature",
    "features/data.feature",
    "features/position-epl2.feature",
    "features/position-zpl2.feature",
    "features/step_definitions/dsl_steps.rb",
    "features/step_definitions/language_steps.rb",
    "features/step_definitions/output_steps.rb",
    "features/support/env.rb",
    "lib/document_value.rb",
    "lib/languages.rb",
    "lib/languages/epl2.rb",
    "lib/languages/epl2/barcode.rb",
    "lib/languages/epl2/document.rb",
    "lib/languages/epl2/font.rb",
    "lib/languages/epl2/position.rb",
    "lib/languages/epl2/text.rb",
    "lib/languages/generic.rb",
    "lib/languages/generic/dots.rb",
    "lib/languages/generic/integer.rb",
    "lib/languages/generic/millimetres.rb",
    "lib/languages/generic/position.rb",
    "lib/languages/zpl2.rb",
    "lib/languages/zpl2/barcode.rb",
    "lib/languages/zpl2/document.rb",
    "lib/languages/zpl2/font.rb",
    "lib/languages/zpl2/merge_font.rb",
    "lib/languages/zpl2/position.rb",
    "lib/languages/zpl2/text.rb",
    "lib/utils/array.rb",
    "lib/zebra_printer.rb",
    "lib/zebra_printer_document.rb",
    "spec/lib/languages/epl2/barcode_1d_spec.rb",
    "spec/lib/languages/epl2/barcode_2d_spec.rb",
    "spec/lib/languages/epl2/barcode_factory_spec.rb",
    "spec/lib/languages/epl2/document_spec.rb",
    "spec/lib/languages/epl2/font_spec.rb",
    "spec/lib/languages/epl2/position_spec.rb",
    "spec/lib/languages/epl2/text_spec.rb",
    "spec/lib/languages/generic/dots.rb",
    "spec/lib/languages/generic/millimetres.rb",
    "spec/lib/languages/generic/position_spec.rb",
    "spec/lib/languages/languages.rb",
    "spec/lib/languages/zpl2/barcode1d_spec.rb",
    "spec/lib/languages/zpl2/barcode2d_spec.rb",
    "spec/lib/languages/zpl2/barcode_factory_spec.rb",
    "spec/lib/languages/zpl2/document_spec.rb",
    "spec/lib/languages/zpl2/font_spec.rb",
    "spec/lib/languages/zpl2/position_spec.rb",
    "spec/lib/languages/zpl2/text_spec.rb",
    "spec/lib/zebra_printer_document.rb",
    "spec/spec_helper.rb",
    "zebra_printer.gemspec"
  ]
  s.homepage = "http://github.com/yatsura/zebra_printer".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2.2".freeze
  s.summary = "Zebra printer DSL".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7.0"])
      s.add_development_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 6.0.1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 2.3.9"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.15.1"])
      s.add_development_dependency(%q<cucumber>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 3.7.0"])
      s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 6.0.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.9"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.15.1"])
      s.add_dependency(%q<cucumber>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7.0"])
    s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 6.0.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.9"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.15.1"])
    s.add_dependency(%q<cucumber>.freeze, [">= 0"])
  end
end

