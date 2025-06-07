class TopCommomNames
  def initialize(renderer)
    @output_renderer = renderer
  end

  def call
    sorted = IBGEService.states(asc: true)

    @output_renderer.display_states(sorted)
    user_choice = @output_renderer.ask_for(:index).to_i - 1
    uf = sorted[user_choice]

    commom_names = IBGEService.most_commom_names(uf.id)
    @output_renderer.display_table_for(uf.name, common_names(commom_names).sort_by { |name| name["ranking"] })

    puts "\n"

    by_sex = %w[f m].each do |sex|
      names_by_sex = IBGEService.most_commom_names(uf.id, sex: sex)
      @output_renderer.display_table_for(uf.name, common_names(names_by_sex).sort_by { |name| name["ranking"] }) do
        gender = (sex == "f") ? "FEMALE" : "MALE"
        "Most commom #{gender} names at #{uf.name}"
      end
    end
  end

  def common_names(names)
    names[0]["res"]
  end
end
