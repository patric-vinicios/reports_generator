defmodule ReportsGeneratorTest do
  use ExUnit.Case
  alias ReportsGenerator

  describe "build/1" do
    test "builds the report" do
      filename = "report_test"

      response = ReportsGenerator.call(filename)

      expected_response = %{
        "foods" => %{
          "açaí" => 1,
          "churrasco" => 2,
          "esfirra" => 3,
          "hambúrguer" => 2,
          "pastel" => 0,
          "pizza" => 2,
          "prato_feito" => 0,
          "sushi" => 0
        },
        "users" => %{
          "1" => 48,
          "10" => 36,
          "11" => 0,
          "12" => 0,
          "13" => 0,
          "14" => 0,
          "15" => 0,
          "16" => 0,
          "17" => 0,
          "18" => 0,
          "19" => 0,
          "2" => 45,
          "20" => 0,
          "21" => 0,
          "22" => 0,
          "23" => 0,
          "24" => 0,
          "25" => 0,
          "26" => 0,
          "27" => 0,
          "28" => 0,
          "29" => 0,
          "3" => 31,
          "30" => 0,
          "4" => 42,
          "5" => 49,
          "6" => 18,
          "7" => 27,
          "8" => 25,
          "9" => 24
        }
      }

      assert response == expected_response
    end
  end

  describe "fetch_higher_cost/1" do
    test "when the option is 'users', returns the user who spent the most" do
      filename = "report_test"
      
      response =
        filename
        |> ReportsGenerator.call()
        |> ReportsGenerator.fetch_higher_cost("users")

      expected_response = {"5", 49}

      assert response == expected_response
    end

    test "when the option is 'foods', returns the user who spent the most" do
      filename = "report_test"

      response =
        filename
        |> ReportsGenerator.call()
        |> ReportsGenerator.fetch_higher_cost("foods")

      expected_response = {"esfirra", 3}

      assert response == expected_response
    end

    test "when an invalid option is givern, returns an error" do
      filename = "report_test"

      response =
        filename
        |> ReportsGenerator.call()
        |> ReportsGenerator.fetch_higher_cost("banana")

      expected_response = {:error, "Invalid option"}

      assert response == expected_response
    end

  end

end
