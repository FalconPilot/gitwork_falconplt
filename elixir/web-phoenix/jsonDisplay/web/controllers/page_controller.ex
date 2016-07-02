defmodule JsonDisplay.PageController do
  use JsonDisplay.Web, :controller

  # Load external page
  def loadpage(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
    end
  end

  # Load JSON
  def loadjson(url) do
    Poison.decode! loadpage(url)
  end

  # Render index page
  def index(conn, _params) do
    url = "http://atelier-prog.github.io/topics/products.json"
    raw = loadjson(url)
    conn
    |> assign(:products, raw)
    |> assign(:url, url)
    |> render "index.html"
  end

end
