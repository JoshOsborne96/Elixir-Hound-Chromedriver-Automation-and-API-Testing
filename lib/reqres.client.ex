defmodule ReqresClient do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://reqres.in"
  plug Tesla.Middleware.JSON

  def get_user(id) do
    get("/api/users/#{id}")
  end

  def create_user(map) do
    post("/api/users", map)

  end

  def update_user(id, map) do
    put("/api/users/#{id}", map)
  end

  def delete_user(id) do
    delete("/api/users/#{id}")
  end
end
