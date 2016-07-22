defmodule ScraperTest do
  use ExUnit.Case
  doctest Scraper

  @calendar_html """
    <div>
      <a class="day__event-title" href="https://www.smallslive.com/events/01-quintet/">
      <a class="day__event-title" href="https://www.smallslive.com/events/02-trio/">
      <a class="day__event-title" href="https://www.smallslive.com/events/03-quintet/">
  """
  defp calendar_html, do: @calendar_html

  @artist_html """
    <div class="event-view__header__info__container">
      <span class="event-view__header__meta__time">
        Sunday, April 3, 2016
        <span>|</span>
        10:30 PM - 1:00 AM
      </span>
      <h1 class="event-view__header__meta__title">
        The Big Band!
      </h1>
    </div>
    <div class="mini-artist">
      <div class="mini-artist__image">
        <a>
          <img src="/swinging-guitar.png">
        </a>
      </div>
      <div class="mini-artist-info">
        <h2 class="mini-artist-info__title">
          <a>Swinging Guitar</a>
        </h2>
        <p class="mini-artist-info__instrument">
          Guitar
        </p>
        <a class="mini-artist-info__button" href="/artists/824-swinging-guitar/">
          Artist profile
        </a>
      </div>
    </div>
    <div class="mini-artist">
      <div class="mini-artist-info">
        <h2 class="mini-artist-info__title">
          <a>Swinging Piano</a>
        </h2>
        <p class="mini-artist-info__instrument">
          Piano
        </p>
        <a class="mini-artist-info__button" href="/artists/123-swinging-piano/">
          Artist profile
        </a>
      </div>
    </div>

  """
  defp artist_html, do: @artist_html
  defp artist_info, do: Scraper.artists(artist_html) |> hd |> Scraper.artist_info
  defp gig_info, do: Floki.parse(artist_html) |> Scraper.gig_info

  test "parses 1 artist" do
    html = "<div class=\"mini-artist\"></div>"
    assert Scraper.artists(html) |> length == 1
  end

  test "parses 2 artists" do
    html = "<div class=\"mini-artist\"></div><div class=\"mini-artist\"></div>"
    assert Scraper.artists(html) |> length == 2
  end

  test "parses name" do
    assert artist_info[:name] === "Swinging Guitar"
  end

  test "parses instrument" do
    assert artist_info[:instrument] === "Guitar"
  end

  test "parses url" do
    assert artist_info[:url] === "/artists/824-swinging-guitar/"
  end

  test "parses image" do
    assert artist_info[:image] === "/swinging-guitar.png"
  end

  test "parses title" do
    assert gig_info[:title] === "The Big Band!"
  end

  test "parses dates past midnight" do
    dates = Scraper.dates("Sunday, April 3, 2016 | 10:30 PM - 1:00 AM")

    assert dates ==
      [
        elem(Timex.parse("2016-04-03T22:30:00.000+00:00", "{ISO:Extended}"), 1),
        elem(Timex.parse("2016-04-04T01:00:00.000+00:00", "{ISO:Extended}"), 1)
      ]
  end

  test "parses dates before midnight" do
    dates = Scraper.dates("Sunday, April 3, 2016 | 7:30 PM - 10:00 PM")

    assert dates ==
      [
        elem(Timex.parse("2016-04-03T19:30:00.000+00:00", "{ISO:Extended}"), 1),
        elem(Timex.parse("2016-04-03T22:00:00.000+00:00", "{ISO:Extended}"), 1)
      ]
  end

  test "parses event urls" do
    urls = Scraper.event_urls(calendar_html)
    assert urls |> length === 3
    urls |> Enum.map(fn(url) -> assert Regex.match?(~r/^https?:\/\/www.smallslive.com\/events/, url), url end)
  end
end
