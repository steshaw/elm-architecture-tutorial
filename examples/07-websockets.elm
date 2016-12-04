import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import WebSocket

import Bootstrap exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

echoServer : String
echoServer =
  "ws://echo.websocket.org"

-- Model

type alias Model =
  { message : String
  , messages : List String
  }

init : (Model, Cmd Msg)
init =
  (Model "" [], Cmd.none)

-- View

onEnter : Msg -> Attribute Msg
onEnter msg =
  on "keyup" (Json.andThen (\k ->
    if k == 13 then
      Json.succeed msg
    else
      Json.fail "happily ignoring a non-enter keypress"
  ) keyCode)

view : Model -> Html Msg
view model =
  Bootstrap.wrap "07-websockets"
    [ div []
        [ input [class "form-control", onInput Input, onEnter Send, value model.message] []
        , button [class "btn btn-secondary", onClick Send] [text "Send"]
        , div [] (List.map viewMessage model.messages)
        ]
    ]

viewMessage : String -> Html msg
viewMessage msg =
  div [] [ text msg ]

-- Update

type Msg
  = Input String
  | Send
  | NewMessage String
  | Nothing

update : Msg -> Model -> (Model, Cmd Msg)
update msg {message, messages} =
  case msg of
    Input newInput ->
      (Model newInput messages, Cmd.none)

    Send ->
      (Model "" messages, WebSocket.send echoServer message)

    NewMessage str ->
      (Model message (messages ++ [str]), Cmd.none)

    Nothing -> (Model message messages, Cmd.none)

-- Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
  WebSocket.listen echoServer NewMessage
