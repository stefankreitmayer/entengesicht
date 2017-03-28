module View exposing (view)

import Html exposing (Html, h2, div)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Model exposing (..)
import Model.Scene exposing (..)
import Model.Compound exposing (..)
import Subscription exposing (..)


view : Model -> Html Msg
view {started, scene} =
  if started then
    viewPlayScreen scene
  else
    viewStartScreen scene


viewStartScreen : Scene -> Html Msg
viewStartScreen scene =
  let
      button = Html.button [ onClick Start ] [ Html.text "Start" ]
  in
      div
        [ class "Screen" ]
        [ h2 [] [ Html.text "Turn audio on" ]
        , buttonGroup [ button ]
        ]

viewPlayScreen : Scene -> Html Msg
viewPlayScreen scene =
  let
      button1 = Html.button [ onClick (Mutate Part1) ] []
      button2 = Html.button [ onClick (Mutate Part2) ] []
  in
      div
        [ class "Screen" ]
        [ h2 [] [ Html.text (glue scene.compound) ]
        , buttonGroup [ button1, button2 ]
        ]


buttonGroup : List (Html Msg) -> Html Msg
buttonGroup buttons =
 div
   [ class "ButtonGroup" ]
   buttons
