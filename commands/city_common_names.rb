class CityCommonNames
  def initialize(renderer)
    @output_renderer = renderer
  end

  def call
    # Ask for city name
    begin
      city_name = @output_renderer.ask_for(:city)
      location = IBGEService.find_district(city_name)
    rescue IBGEService::NotFoundDistrictError => e
      puts "#{e}, can't find city containing #{city_name}"
      exit(1)
    end
    # binding.pry
    common_names = IBGEService.most_commom_names(location.id)
    @output_renderer.display_table_for(location.name, common_names[0]["res"])

    puts "\n"

    by_sex = %w[f m].each do |sex|
      names_by_sex = IBGEService.most_commom_names(location.id, sex: sex)
      @output_renderer.display_table_for(location.name, common_names[0]["res"].sort_by { |name| name["ranking"] }) do
        gender = (sex == "f") ? "FEMALE" : "MALE"
        "Most commom #{gender} names at #{location.name}"
      end
    end

  end
end
