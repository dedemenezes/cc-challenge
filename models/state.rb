class State
  attr_reader :id, :name, :sigla

  def initialize(options={})
    options.transform_keys!(&:to_sym) if options

    @id = options[:id]
    @name = options[:nome]
    @sigla = options[:sigla]
  end
end
