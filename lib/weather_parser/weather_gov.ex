defmodule WeatherParser.WeatherGov do
  require Logger

  @api_url Application.get_env(:weather_parser, :api_url)
  @headers [{"User-agent", "Elixir rhian.luis.cs+github@gmail.com"}]

  def fetch(location) do
    Logger.info(fn -> "Fetching weather data for location #{location}" end)

    location
    |> weather_gov_url()
    |> HTTPoison.get(@headers)
    |> handle_response()
  end

  def weather_gov_url(location) do
    "#{@api_url}/xml/current_obs/#{location}.xml"
  end

  defp handle_response({:ok, %{status_code: 200, body: body}}) do
    Logger.debug("Weather API responded with body: #{body}")

    {:ok, WeatherXmlParser.parse(body)}
  end

  defp handle_response({_, %{status_code: _, body: body}}) do
    {:error, body}
  end
end
