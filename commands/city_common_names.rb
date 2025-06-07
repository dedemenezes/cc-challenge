class CityCommonNames
  def initialize(renderer)
    @output_renderer = renderer
  end

  def call
    # Ask for city name
    city_name = @output_renderer.ask_for(:city)
    location = IBGEService.find_district(city_name)
    common_names = IBGEService.most_commom_names(location.id)
    @output_renderer.display_table_for(location.name, common_names[0]["res"])
  end
end
