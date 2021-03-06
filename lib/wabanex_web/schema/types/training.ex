defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schema.Types.Exercise

  @desc "Logic training representation"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise)
  end

  input_object :create_training_input do
    field :user_id, non_null(:uuid4), description: "User ID"
    field :start_date, non_null(:string), description: "Training start date"
    field :end_date, non_null(:string), description: "Training end date"

    field :exercises, list_of(:create_exercise_input),
      description: "List of training's exercises input"
  end
end
