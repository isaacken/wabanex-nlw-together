defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns the user" do
      params = %{name: "Isaac", email: "isaac@teste.com", password: "2345meia78"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{name: "Isaac", email: "isaac@teste.com", password: "2345meia78"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{name: "I", email: "isaac@teste.com"}

      response = User.changeset(params)

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
