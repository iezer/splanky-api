defmodule EventInserter do
  alias Cats.Artist
  alias Cats.Event
  alias Cats.Repo

  def find_or_create_artist(params) do
    case Repo.get_by(Artist, url: params.url) do
      nil ->
        Artist.changeset(%Artist{}, params)
        |> Repo.insert |> elem(1)
      artist ->
        artist
    end
  end

  def create_event(params, url) do
    params = Map.put(params, :url, url)
    Event.changeset(%Event{}, params)
    |> Repo.insert |> elem(1)
  end

  def insert_event(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->

        gig_info = Floki.parse(body)
        |> Scraper.gig_info
        |> create_event(url)

        artists = Scraper.artists(body)
        |> Enum.map(&Scraper.artist_info/1)
        |> Enum.map(fn(artist) -> find_or_create_artist(artist) end)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  # Usage
  # url = "https://www.smallslive.com/events/calendar/2016/6/"
  # EventInserter.insert_events(url)
  def insert_events(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->

        Scraper.event_urls(body)
        |> Enum.map(fn(u) -> insert_event(Enum.join(["https://www.smallslive.com", u], "")) end)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
