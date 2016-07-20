defmodule Scraper do
  def artists(html) do
    Floki.find(html, ".mini-artist")
  end

  def artist_info(html) do
    %{
      name: clean_text(html, ".mini-artist-info__title a"),
      instrument: clean_text(html, ".mini-artist-info__instrument"),
      url: first_attribute(html, ".mini-artist-info__button", "href")
    }
  end

  def gig_info(html) do
    [ start_date, end_date ] = date_text(html, ".event-view__header__meta__time")
    |> dates
    %{
      start_date: start_date,
      end_date: end_date,
      title: clean_text(html, ".event-view__header__meta__title")
    }
  end

  def event_urls(html), do: Floki.find(html, "a.no-bg-calendar__event") |> Floki.attribute("href")

  # PRIVATE METHODS

  defp clean_text(html, selector) do
    Floki.find(html, selector) |> Floki.text |> String.strip
  end

  defp first_attribute(html, selector, attr) do
    Floki.find(html, selector) |> Floki.attribute(attr) |> hd
  end

  defp date_text(html, selector) do
    Floki.find(html, selector) |>
      Floki.text
  end

  def dates(date_text) do
    [date_string, times] = date_text |>
      String.split("|") |>
      Enum.map(&String.strip/1)
    [date_string, times]
    [start_time, end_time] = String.split(times, " - ")
    start_date = Enum.join([date_string, start_time], " ")
    end_date = Enum.join([date_string, end_time], " ")
    [start_date, end_date] = Enum.map([start_date, end_date], fn s-> Timex.parse(s, "%A, %B %e, %Y %l:%M %p", :strftime) end)
    start_date = elem(start_date, 1)
    end_date = elem(end_date, 1)
    end_date = cond do
      Timex.before?(end_date, start_date) ->
        Timex.shift(end_date, days: 1)
      true ->
        end_date
    end
    [start_date, end_date]
  end
end
