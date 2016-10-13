import Html exposing (Html, div, text)
import Html.App exposing (program)
import Html.Events exposing (onClick)

import Ports

main =
    program {
        init = init,
        subscriptions = always Sub.none,
        update = update,
        view = view
    }

type Order = OneTwo | TwoOne

type alias Model = ()

type alias Msg = Order

init : (Model, Cmd Msg)
init =
    ((), Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        OneTwo -> ((), Cmd.batch [Ports.portone (), Ports.porttwo ()])
        TwoOne -> ((), Cmd.batch [Ports.porttwo (), Ports.portone ()])

view : Model -> Html Msg
view model =
    div [] [
        div [ onClick OneTwo ] [ text "one then two" ],
        div [ onClick TwoOne ] [ text "two then one" ]
    ]
