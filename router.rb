require "json"
require "faraday"
require "pry-byebug"

require_relative "./commands/city_common_names"
require_relative "./commands/top_commom_names"
require_relative "./services/i_b_g_e_service"
require_relative "./services/output_renderer"


class Router
  COMMANDS = {
    "1" => -> { TopCommomNames.new(OutputRenderer.new) },
    "2" => -> { CityCommonNames.new(OutputRenderer.new)}
  }

  def initialize
    @running = true
    @action = nil
  end

  def run
    while @running
      display_menu
      print("> ")
      @action = gets.chomp
      print(`clear`)
      case @action
      when "1" then COMMANDS[@action]&.call.call
      when "2" then COMMANDS[@action]&.call.call
      when "3" then puts "TODO: 3. Frequência do uso de um nome ao longo dos anos"
      when "q"
        @running = false if ["q", "quit"].include?(@action)
      when "quit"
        @running = false if ["q", "quit"].include?(@action)
      else
        puts "Unknow action. Try again"
      end
      puts "\n"
    end
  end

  private

  def display_menu
    puts "1. Ranking dos nomes mais comuns em uma determinada Unidade Federativa (UF)"
    puts "2. Ranking dos nomes mais comuns em uma determinada cidade"
    puts "3. Frequência do uso de um nome ao longo dos anos"
    puts "Type 'q' or 'quit' to exit"
  end

end
