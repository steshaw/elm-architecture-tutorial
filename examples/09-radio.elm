import Html exposing (Html, Attribute, div, fieldset, input, label, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown

import Bootstrap exposing (..)

main =
  Html.beginnerProgram
    { model = chapter1
    , update = update
    , view = view
    }

-- Model

type alias Model =
  { fontSize : FontSize
  , content : String
  }

type FontSize
  = Small
  | Medium
  | Large

chapter1 : Model
chapter1 =
  Model Medium intro

intro : String
intro = """

# Anna Karenina

## Chapter 1

Happy families are all alike; every unhappy family is unhappy in its own way.

Everything was in confusion in the Oblonskys’ house. The wife had discovered
that the husband was carrying on an intrigue with a French girl, who had been
a governess in their family, and she had announced to her husband that she
could not go on living in the same house with him...

"""

-- View

view : Model -> Html Msg
view model =
  Bootstrap.wrap "09-radio"
    [ div []
        [ fieldset []
            [ radio "Small" (SwitchTo Small)
            , radio "Medium" (SwitchTo Medium)
            , radio "Large" (SwitchTo Large)
            ]
        , Markdown.toHtml [ sizeToStyle model.fontSize ] model.content
        ]
    ]

radio : String -> msg -> Html msg
radio value msg =
  label
    [ class "form-check-inline"
    , style [("padding", "20px")]
    ]
    [ input [ class "form-check-input", type_ "radio", name "font-size", onClick msg ] []
    , text value
    ]

sizeToStyle : FontSize -> Attribute msg
sizeToStyle fontSize =
  let
    size =
      case fontSize of
        Small ->
          "0.8em"

        Medium ->
          "1em"

        Large ->
          "1.2em"
  in
    style [("font-size", size)]

-- Update

type Msg
  = SwitchTo FontSize

update : Msg -> Model -> Model
update msg model =
  case msg of
    SwitchTo newFontSize ->
      { model | fontSize = newFontSize }
