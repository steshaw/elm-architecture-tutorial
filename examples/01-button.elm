import Html exposing (..)
import Html.Attributes exposing (..)
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

script : List (Html.Attribute msg) -> List (Html msg) -> Html msg
script attributes children = node "script" attributes children

integrity : String -> Html.Attribute msg
integrity v = attribute "integrity" v

crossOrigin : String -> Html.Attribute msg
crossOrigin v = attribute "crossorigin" v

bootstrapV4 : List (Html msg)
bootstrapV4 =
  [ node "link"
    [ rel "stylesheet"
    , href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
    , integrity "sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi"
    , crossOrigin "anonymous"
    ] []
  , script
    [ src "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
    , integrity "sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7"
    , crossOrigin "anonymous"
    ] []
  , script
    [ src "https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js"
    , integrity "sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8"
    , crossOrigin "anonymous"
    ] []
  , script
    [ src "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
    , integrity "sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
    , crossOrigin "anonymous"
    ] []
  ]

role : String -> Html.Attribute msg
role v = attribute "role" v

ariaLabel : String -> Html.Attribute msg
ariaLabel v = attribute "aria-label" v

view : Model -> Html Msg
view model =
  div [class "container"]
    ([ div [class "container"]
      [ h1 [] [text "01-button"]
      , p []
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
      ]
    , div
        [ class "alert alert-info"
        , attribute "role" "alert"
        ]
        [ text ("model: " ++ (toString model)) ]
    ] ++ bootstrapV4)

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
