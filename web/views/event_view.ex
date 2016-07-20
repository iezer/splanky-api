defmodule Cats.EventView do
  use Cats.Web, :view

  def render("index.json", %{events: events}) do
    %{data: render_many(events, Cats.EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, Cats.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{
      type: "event",
      id: event.id,
      attributes: %{
        title: event.title,
        name: event.title,
        artist_ids: event.artist_ids,
        url: event.url,
        start_time: event.start_time,
        end_time: event.end_time
      }
    }
  end
end
