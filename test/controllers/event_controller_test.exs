defmodule Cats.EventControllerTest do
  use Cats.ConnCase

  alias Cats.Event
  @valid_attrs %{end_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, start_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, url: "some content", title: "some title", artist_ids: "1,2,3"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/vnd.api+json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, event_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = get conn, event_path(conn, :show, event)
    assert json_response(conn, 200)["data"] == %{
      "id" => event.id,
      "type" => "event",
      "attributes" => %{
        "url" => event.url,
        "title" => event.title,
        "name" => event.title,
        "artist_ids" => event.artist_ids,
        "start_time" => event.start_time,
        "end_time" => event.end_time
      }
    }
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, event_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, event_path(conn, :create), event: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Event, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, event_path(conn, :create), event: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = put conn, event_path(conn, :update, event), event: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Event, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = put conn, event_path(conn, :update, event), event: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = delete conn, event_path(conn, :delete, event)
    assert response(conn, 204)
    refute Repo.get(Event, event.id)
  end
end
