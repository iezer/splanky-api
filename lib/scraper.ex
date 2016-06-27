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

  def date(date_string) do
    { :ok, date } = Timex.parse(date_string, "%A, %B %e, %Y", :strftime)
    { :ok, ret } = Timex.format(date, "%F", :strftime) #YYYY-MM-DD
    ret
  end

  def gig_info(html) do
    [ date_string, time ] = date_time(html, ".event-view__header__meta__time")
    %{
      date_string: date_string,
      date: date(date_string),
      time: time,
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

  defp date_time(html, selector) do
    Floki.find(html, selector) |>
      Floki.text |>
      String.split("|") |>
      Enum.map(&String.strip/1)
  end
end
