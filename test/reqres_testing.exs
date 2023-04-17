defmodule TeslaTesting do
  use ExUnit.Case


  test "get single user API" do

    {:ok, response} = ReqresClient.get_user(2)

    assert %{"data" => %{"id" => 2}} = response.body
    assert %{"data" => %{"first_name" => "Janet"}} = response.body
    assert 200 == response.status

  end


  test "user not found" do

    {:ok, response} = ReqresClient.get_user(32)

    assert %{} == response.body
    assert 404 == response.status

  end

  test "create new user" do

    map = %{name: "morpheus", job: "leader"}

    {:ok, response} = ReqresClient.create_user(map)

    assert %{"job" => "leader", "name" => "morpheus"} = response.body
    assert 201 == response.status
  end

  test "update user" do

    map = %{name: "Bill", job: "zion resident"}

    {:ok, response} = ReqresClient.update_user(2, map)

    assert %{"job" => "zion resident", "name" => "Bill"} = response.body
    assert 200 == response.status

  end

  test "delete user" do

    {:ok, response} = ReqresClient.delete_user(2)

    assert "" == response.body
    assert 204 == response.status

  end
end
