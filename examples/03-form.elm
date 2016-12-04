import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

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
  , password : String
  , passwordAgain : String
  }

model : Model
model =
  Model "" "" ""

-- View

view : Model -> Html Msg
view model =
  Bootstrap.wrap "03-form"
    [ div []
        [ input [ type_ "text", placeholder "Name", class "form-control", onInput Name ] []
        , input [ type_ "password", placeholder "Password", class "form-control", onInput Password ] []
        , input [ type_ "password", placeholder "Re-enter Password", class "form-control", onInput PasswordAgain ] []
        , viewValidation model
        ]
    ]

viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.password == "" || model.passwordAgain == "" then
        ("green", "")
      else if model.password == model.passwordAgain then
        ("green", "OK")
      else
        ("red", "Passwords do not match!")
  in
    div [ style [("color", color)] ] [ text message ]

-- Update

type Msg
    = Name String
    | Password String
    | PasswordAgain String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }
