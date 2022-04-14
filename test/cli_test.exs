defmodule CliTest do
  use ExUnit.Case

  doctest WeatherParser

  import WeatherParser.CLI, only: [parse_args: 1]

  test "returns :help when called with -h or --help" do
    assert parse_args(["-h", "something"]) == :help
    assert parse_args(["--help", "something"]) == :help
  end

  test "returns a location when the location is passed" do
    assert parse_args(["KDTO"]) == "KDTO"
  end

  test "returns :help if no args are passed" do
    assert parse_args([]) == :help
  end
end
