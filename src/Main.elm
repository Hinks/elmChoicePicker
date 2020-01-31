module Main exposing (..)

import Browser
import Element as E
import Element.Background as BG
import Element.Border as Border
import Element.Events as Events
import Element.Input as Input
import Html exposing (Html)


main : Program () Model msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL

type alias Model = Int


init : Model
init = 1



-- UPDATE
update : msg -> Model -> Model
update msg model =
    model


-- VIEW


view : Model -> Html msg
view model =
    E.layout [] <|
        E.column
            [ E.width
                (E.fill
                    |> E.maximum 800
                )
            , E.height E.fill
            , E.centerX
            , E.paddingXY 20 20
            , E.spacingXY 0 10
            , Border.width 2
            , Border.color (E.rgb255 0 0 0)
            , BG.color (E.rgb255 230 236 245)

            --, E.explain Debug.todo
            ]
            [ E.none ]