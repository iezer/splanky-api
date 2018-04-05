defmodule Cats.ArtistControllerTest do
  use Cats.ConnCase

  alias Cats.Artist
  alias Cats.Repo

  @valid_attrs %{}
  @invalid_attrs %{}

  setup do
    conn = build_conn()
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end
  
  defp relationships do
    %{}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, artist_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = get conn, artist_path(conn, :show, artist)
    data = json_response(conn, 200)["data"]
    assert data["id"] == "#{artist.id}"
    assert data["type"] == "artist"
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, artist_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, artist_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "artist",
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Artist, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, artist_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "artist",
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = put conn, artist_path(conn, :update, artist), %{
      "meta" => %{},
      "data" => %{
        "type" => "artist",
        "id" => artist.id,
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Artist, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = put conn, artist_path(conn, :update, artist), %{
      "meta" => %{},
      "data" => %{
        "type" => "artist",
        "id" => artist.id,
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = delete conn, artist_path(conn, :delete, artist)
    assert response(conn, 204)
    refute Repo.get(Artist, artist.id)
  end

end
