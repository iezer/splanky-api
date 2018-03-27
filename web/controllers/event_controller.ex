defmodule Cats.EventController do
  use Cats.Web, :controller

  alias Cats.Event
  alias JaSerializer.Params

  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    events = Repo.all(Event)
    render(conn, "index.json-api", data: events)
  end

  def create(conn, %{"data" => data = %{"type" => "event", "attributes" => _event_params}}) do
    changeset = Event.changeset(%Event{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, event} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", event_path(conn, :show, event))
        |> render("show.json-api", data: event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)
    render(conn, "show.json-api", data: event)
  end

  def update(conn, %{"id" => id, "data" => data = %{"type" => "event", "attributes" => _event_params}}) do
    event = Repo.get!(Event, id)
    changeset = Event.changeset(event, Params.to_attributes(data))

    case Repo.update(changeset) do
      {:ok, event} ->
        render(conn, "show.json-api", data: event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(event)

    send_resp(conn, :no_content, "")
  end

end
