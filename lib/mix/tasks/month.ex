defmodule Mix.Tasks.Month do
  use Mix.Task

  @shortdoc "Load events for next month."
  def run(_) do
    now = DateTime.utc_now

    # get next month, wrap around for year
    year = now.year
    month = now.month

    year = if(month == 12, do: year + 1, else: year)
    month = if(month == 12, do: 1, else: month + 1)

    url = "https://www.smallslive.com/events/calendar/#{year}/#{month}/"
    IO.puts("loading events with URL #{url}");
  end
end
