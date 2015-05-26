# encoding: utf-8
require "logstash/outputs/base"
require "logstash/namespace"

# An example output that does nothing.
class LogStash::Outputs::Say < LogStash::Outputs::Base
  config_name "say"

  config :text, :validate => :string
  config :source, :validate => :string, :default => "message"
  config :voice, :validate => :string, :default => "Junior"

  public
  def register
  end # def register

  public
  def receive(event)
    if @text then
      system("say -v #{@voice} '#{@text}'")
    else
      system("say -v #{@voice} '#{event[@source]}'")
    end
  end # def event
end # class LogStash::Outputs::Example
