import Html exposing (Html, button, div, text)
import Html.Attributes exposing (disabled, style)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram
    { model = model
    , update = update
    , view = view
    }

-- Model

type alias Model =
  { count : Int
  }

model : Model
model = {count = 0}

-- View

view : Model -> Html Msg
view model =
  div []
    [ Html.span [style
        [ ("min-width", "2em")
        , ("display", "inline-block") ] ]
        [ text (toString model.count) ]
    , button [ onClick Decrement, disabled (model.count <= 0) ] [ text "-" ]
    , button [ onClick Increment ] [ text "+" ]
    , div [] [ text ("model: " ++ (toString model)) ]
    ]

-- Update

type Msg
  = Increment
  | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model | count = model.count + 1 }
    Decrement ->
      if model.count > 0 then
        { model | count = model.count - 1 }
      else model
