require "faraday"
require_relative "../models/state"

class IBGEService
  BASE_URL = "https://servicodados.ibge.gov.br/api"
  STATES_ENDPOINT = "v1/localidades/estados"
  NAMES_RANKING_ENDPOINT = "v2/censos/nomes/ranking"

  def self.most_commom_names(id, options = {})
    query_params = "localidade=#{id}"

    query_params += "&sexo=#{options[:sex]}" if options[:sex]

    names_response = Faraday.get("#{BASE_URL}/#{NAMES_RANKING_ENDPOINT}?#{query_params}")

    begin
      JSON.parse names_response.body
    rescue JSON::ParserError => e
      puts e
      nil
    end
  end

  def self.states(options = {})
    states = fetch_states

    return [] unless states

    states = states.map { |data| State.new(data) }

    sort_states(states, options)
  end

  def self.sort_states(states, options)
    return states unless options.key?(:asc) || options.key?(:desc)

    sorted = states.sort_by(&:sigla)
    should_reverse = options[:desc] == true || options[:asc] == false
    should_reverse ? sorted.reverse : sorted
  end

  def self.fetch_states
    response = Faraday.get("#{BASE_URL}/#{STATES_ENDPOINT}")

    begin
      JSON.parse(response.body)
    rescue JSON::ParserError => e
      puts e
      nil
    end
  end
end
