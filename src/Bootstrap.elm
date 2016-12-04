module Bootstrap exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

script : List (Html.Attribute msg) -> List (Html msg) -> Html msg
script attributes children = node "script" attributes children

integrity : String -> Html.Attribute msg
integrity v = attribute "integrity" v

crossOrigin : String -> Html.Attribute msg
crossOrigin v = attribute "crossorigin" v

role : String -> Html.Attribute msg
role v = attribute "role" v

ariaLabel : String -> Html.Attribute msg
ariaLabel v = attribute "aria-label" v

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

wrap : String -> List (Html msg) -> Html msg
wrap title children =
  div [class "container"] (
    [ h1 [] [text title]
    , div
        [class "container"]
        children
    ] ++ bootstrapV4)
