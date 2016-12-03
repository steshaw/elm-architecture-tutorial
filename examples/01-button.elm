import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Bootstrap exposing (..)

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
  Bootstrap.wrap "01-button"
    [ p []
      [ Html.span [style
          [ ("min-width", "2em")
          , ("display", "inline-block") ] ]
          [ text (toString model.count) ]
      , div
        [ class "btn-group"
        , role "group"
        , ariaLabel "Basic example"
        ]
        [ button
            [ class "btn btn-primary"
            , onClick Decrement, disabled (model.count <= 0)
            ]
            [ text "-" ]
        , button
            [ class "btn btn-primary"
            , onClick Increment
            ]
            [ text "+" ]
        ]
      ]
    , div
        [ class "alert alert-info"
        , attribute "role" "alert"
        ]
        [ text ("model: " ++ (toString model)) ]
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
