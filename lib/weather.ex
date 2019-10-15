defmodule Robot.Weather do
  @host_name "https://www.metaweather.com/api/location"
  defp get_location_id(location) do
    Robot.Converse.say("Getting weather for #{location}")

    case HTTPoison.get("#{@host_name}/search/?query=#{location}") do
      {:ok, %HTTPoison.Response{body: body}} ->
        IO.inspect(body)
        Poison.decode(body)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp get_weather_data(location_meta) do
    location_id = hd(location_meta) |> (& &1["woeid"]).()

    case HTTPoison.get("#{@host_name}/#{location_id}/") do
      {:ok, %HTTPoison.Response{body: body}} ->
        Poison.decode(body)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp format_temperature(temperature) do
    temperature
    |> Float.floor(2)
    |> Float.to_string()
    |> (&"#{&1}°").()
  end

  defp format_for_humans(weather_report) do
    Enum.reduce(
      weather_report["consolidated_weather"],
      "",
      fn day, acc ->
        acc <>
          "\n" <>
          day["weather_state_name"] <>
          " on " <>
          day["applicable_date"] <>
          ", with a minimum of " <>
          format_temperature(day["min_temp"]) <>
          " and a maximum of " <> format_temperature(day["max_temp"])
      end
    )
  end

  def get_weather_report(location) do
    with {:ok, location_id} <- get_location_id(location),
         {:ok, result} <- get_weather_data(location_id) do
      result
      |> format_for_humans()
    else
      {:error, reason} -> {:error, reason}
    end
  end
end
