require_relative "../test_helper"
require_relative "../../services/i_b_g_e_service"

class IBGEServiceTest < Minitest::Test
  def test_states_returns_an_array_of_state_objects
    stub_request(:get, "https://servicodados.ibge.gov.br/api/v1/localidades/estados")
      .to_return(body: [{:id => 33, :sigla => "RJ", :nome => "Rio de Janeiro", "regiao" => {id: 3, sigla: "SE", nome: "Sudeste"}}].to_json)

    actual = IBGEService.states
    assert_equal "Rio de Janeiro", actual.first.name
  end

  def test_states_accepts_ordering_by_passing_asc
    stub_request(:get, "https://servicodados.ibge.gov.br/api/v1/localidades/estados")
      .to_return(body: [{:id => 33, :sigla => "RJ", :nome => "Rio de Janeiro", "regiao" => {id: 3, sigla: "SE", nome: "Sudeste"}},
        {:id => 11, :sigla => "SP", :nome => "São Paulo", "regiao" => {id: 3, sigla: "SE", nome: "Sudeste"}}].to_json)

    actual = IBGEService.states(asc: false)
    refute_equal "Rio de Janeiro", actual.first.name
    assert_equal "São Paulo", actual.first.name

    actual = IBGEService.states(asc: true)
    refute_equal "Rio de Janeiro", actual[1].name
    assert_equal "São Paulo", actual[1].name
  end

  def test_states_accepts_ordering_by_passing_desc
    stub_request(:get, "https://servicodados.ibge.gov.br/api/v1/localidades/estados")
      .to_return(body: [{:id => 33, :sigla => "RJ", :nome => "Rio de Janeiro", "regiao" => {id: 3, sigla: "SE", nome: "Sudeste"}},
        {:id => 11, :sigla => "SP", :nome => "São Paulo", "regiao" => {id: 3, sigla: "SE", nome: "Sudeste"}}].to_json)

    actual = IBGEService.states(desc: false)
    refute_equal "Rio de Janeiro", actual[1].name
    assert_equal "São Paulo", actual[1].name

    actual = IBGEService.states(desc: true)
    refute_equal "Rio de Janeiro", actual.first.name
    assert_equal "São Paulo", actual.first.name
  end

  def test_handles_empty_API_response_gracefully
    stub_request(:get, /ibge/).to_return(body: "")
    assert_equal [], IBGEService.states
  end

  def test_handles_invalid_json_gracefully
    stub_request(:get, /ibge/).to_return(body: "invalid-json")
    assert_equal [], IBGEService.states
  end
  # test "raises TimeoutError when request exceeds time limit"
end
