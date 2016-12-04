import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Bootstrap exposing (..)

main =
  Html.beginnerProgram
    { model = optOut
    , update = update
    , view = view
    }

-- Model

type alias Model =
  { notifications : Bool
  , autoplay : Bool
  , location : Bool
  }

optOut : Model
optOut =
  { notifications = False
  , autoplay = False
  , location = False
  }

-- View

view : Model -> Html Msg
view model =
  Bootstrap.wrap "08-checkboxes"
    [ div [class "container"]
        [ checkbox ToggleNotifications "Email Notifications"
        , checkbox ToggleAutoplay "Video Autoplay"
        , checkbox ToggleLocation "Use Location"
        ]
    , div []
        [
          text (toString model)
        ]
    ]

-- Update

type Msg
  = ToggleNotifications
  | ToggleAutoplay
  | ToggleLocation

update : Msg -> Model -> Model
update msg model =
  case msg of
    ToggleNotifications ->
      { model | notifications = not model.notifications }

    ToggleAutoplay ->
      { model | autoplay = not model.autoplay }

    ToggleLocation ->
      { model | location = not model.location }

checkbox : msg -> String -> Html msg
checkbox msg name =
  div [ class "form-check" ]
    [ label [ class "form-check-label" ]
        [ input [ class "form-check-input", type_ "checkbox", onClick msg ]
            []
        , text name
        ]
    ]
