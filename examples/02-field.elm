import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String

import Bootstrap exposing (..)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- Model

type alias Model =
  { name : String
  }

model : Model
model = Model ""

-- View

skipIfEmpty name f =
  if name == "" then
    ""
  else
    f(name)

view : Model -> Html Msg
view model =
  Bootstrap.wrap "02-field"
    [ p []
        [ input [ placeholder "Enter your name", onInput Change ] []
        , div [] [ text (skipIfEmpty model.name (\n -> "Hello " ++ n ++ "!")) ]
        , div [] [ text (skipIfEmpty model.name (\n -> "Reversed name: " ++ String.reverse n)) ]
        ]
    ]

-- Update

type Msg = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newName ->
      { model | name = newName }
