# frozen_string_literal: true

require 'pry-byebug'
require_relative './has_many'
require_relative './has_many_features'

module Selenium
  class WebDriver
    def initialize(browser)
      @browser = browser
    end

    def self.for(browser)
      WebDriver.new(browser)
    end

    def find_element(name, value)
      puts "Find element #{name} with value #{value}"
    end
  end
end

class Page
  extend HasMany
  attr_reader :driver

  def initialize(*_args)
    @driver = Selenium::WebDriver.for :firefox
  end

  has_many :features
end

page = Page.new
puts page.features
