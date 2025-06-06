class State
  attr_reader :id, :name, :sigla

  def initialize(options)
    @id = options["id"]
    @name = options["nome"]
    @sigla = options["sigla"]
  end
end
