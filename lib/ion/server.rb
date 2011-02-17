$:.push *Dir[File.expand_path('../../../vendor/*/lib', __FILE__)]

require 'ion'
require 'cuba'
require 'json'

Ion::Server = Cuba.dup

module Ion::Server
  require File.expand_path('../server/helpers', __FILE__)

  Ron.send :include, JsonHelpers

  class Ron
    def entity(what='')
      # NB: This does not necessarily persist since the
      # server is ideally multithreaded
      $wrappers ||= Hash.new
      $wrappers[what.to_sym] ||= begin
        hash = (Ion.key[:entity][what.to_sym][:options].get rescue nil)
        raise Ion::Error, "Model #{what} was not defined." if hash.nil?
        hash = JSON.parse(hash)
        model = Ion::Wrapper.new(what.to_s)
        model.ion hash
        model
      end
    end
  end
end

Ion::Server.define do
  # POST /define/Model (?body)
  on post do
    on path('index'), segment, param('body') do |model, body|
      hash = JSON.parse(body)
      Ion.key[:entity][model][:options].set hash.to_json
      ok
    end
  end

  # GET /search/_ (?body)
  on path('search'), segment, param('body') do |model, body|
    begin
      e = entity(model)
      hash = JSON.parse(body)
      search = e.ion.search(hash)
      json_output :ids => search.ids
    rescue Ion::Error => e
      error e.message
    end
  end

  # GET /about
  on path('about') do
    json_output(
      :app => "Ion",
      :version => Ion.version
    )
  end

  # GET /
  on path('') do
    res.write %{
      <h1>Ion server</h1>
      Simple reference:
      <ul>
      <li><code><b>POST   /index/Model/id</b> body={json}</code> - Indexes a record</li>
      <li><code><b>DELETE /index/Model/id</b></code> - Deindexes a record</li>
      <li><code><b>POST   /index/Model</b> body={json}</code> - Defines the indices for a model</li>
      <li><code><b>POST   /search/Model</b> body={json}</code> - Searches a Model</li>
      <li><code><b>GET    /about</b></code> - Shows version info</li>
      </ul>
    }.gsub(/^ +/, '')
  end
end
