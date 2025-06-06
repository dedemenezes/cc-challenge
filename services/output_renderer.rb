class OutputRenderer
  def display_states(collection)
    collection.each_with_index do |state, index|
      puts "#{index + 1}. #{state.sigla} - #{state.name} - #{state.id}"
    end
  end

  def ask_for(item)
    puts "#{item.capitalize}?"
    print "> "
    gets.chomp
  end

  def display_table_for(name, collection)
    title = "Most commom names at #{name}"

    title = yield if block_given?

    header_one = "Ranking\s\s"
    header_two = "\s\sName\s\s\s\s\s"

    puts title

    collection.each_with_index do |name, index|
      display_table_headers(header_one, header_two) if index.zero?

      print name["ranking"]
      (9 - name["ranking"].digits.length).times { |_| print("\s") }
      print "|"
      puts "\s\s#{name["nome"].capitalize}"
    end
  end

  private

  def display_table_headers(header_one, header_two)
    display_header_row(header_one, header_two)
    display_header_divider(header_one, header_two)
  end

  def display_header_row(header_one, header_two)
    print header_one
    print "|"
    puts header_two
  end

  def display_header_divider(header_one, header_two)
    print "- " * ((header_one.length + header_two.length) / 4 - 1)
    print "-"
    print "|"
    puts "- " * ((header_one.length + header_two.length) / 4)
  end
end
