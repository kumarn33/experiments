# typed: true

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'sorbet', :group => :development
  gem 'sorbet-runtime'
end

require 'sorbet-runtime'

class Main
  # (2) extend T::Sig to get access to `sig` for annotations:
  extend T::Sig

  # (3) Add a `sig` annotation above your method:
  sig {params(x: String).returns(Integer)}
  def self.main(x)
    x.length
  end

  # alternatively, for a method with no parameters:
  sig {returns(Integer)}
  def no_params
    42
  end
end

Main.main("Hi")