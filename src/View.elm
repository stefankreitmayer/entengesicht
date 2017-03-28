module View exposing (view)

import Html exposing (Html, div)
import Html.Events exposing (onClick)

import Model exposing (..)
import Model.Scene exposing (..)
import Model.Compound exposing (..)
import Subscription exposing (..)

view : Model -> Html Msg
view {scene} =
  let
      button1 = Html.button [ onClick (Mutate Part1) ] [ Html.text "Change First" ]
      button2 = Html.button [ onClick (Mutate Part2) ] [ Html.text "Change Second" ]
  in
      div
        []
        [ Html.text (glue scene.compound)
        , button1
        , button2 ]
