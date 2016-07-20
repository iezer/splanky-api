defmodule Cats.EventTest do
  use Cats.ModelCase

  alias Cats.Event

  @valid_attrs %{end_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, start_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, url: "some content", title: "some title", artist_ids: "1,2,3"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
