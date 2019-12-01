module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Day1
import Html exposing (..)
import Html.Attributes exposing (style)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    Html.main_
        [ style "width" "90%"
        , style "max-width" "80rem"
        , style "margin" "0 auto"
        , style "color" "#313131"
        ]
        [ h1 [] [ text "AoC 2019" ]
        , Day1.view
        ]
