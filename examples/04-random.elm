import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Random

import Bootstrap exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- Model

type alias Model =
  { dieFace : Int
  }

init : (Model, Cmd Msg)
init =
  (Model 1, Cmd.none)

-- View

view : Model -> Html Msg
view model =
  Bootstrap.wrap "04-random"
    [ div []
        [ h2 [] [ text (toString model.dieFace) ]
        , button [ class "btn btn-primary", onClick Roll ] [ text "Roll" ]
        ]
    ]

-- Update

type Msg
  = Roll
  | NewFace Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFace (Random.int 1 6))

    NewFace newFace ->
      (Model newFace, Cmd.none)

-- Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
