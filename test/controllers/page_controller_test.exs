defmodule Cats.PageControllerTest do
  use Cats.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "NYC Jazz Cats Social Graph"
  end
end
