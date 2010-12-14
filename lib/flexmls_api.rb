# Flexmlsapi
require 'rubygems'
require 'curb'
require 'json'

require File.expand_path('../flexmls_api/configuration', __FILE__)
require File.expand_path('../flexmls_api/authentication', __FILE__)
require File.expand_path('../flexmls_api/base', __FILE__)
require File.expand_path('../flexmls_api/client', __FILE__)

module FlexmlsApi
  extend Configuration

  VERSION = File.read(File.dirname(__FILE__) + "/../VERSION").chomp
  
  def logger
    if @logger.nil?
    
    end
    @logger
  end

  def self.client(opts={})
    FlexmlsApi::Client.new(opts)
  end

  def self.method_missing(method, *args, &block)
    return super unless (client.respond_to?(method))
    client.send(method, *args, &block)
  end

end
