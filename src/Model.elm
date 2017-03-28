module Model exposing (..)

import Model.Scene exposing (..)


type alias Model =
  { scene : Scene
  , started : Bool }


initialModel : Model
initialModel =
  { scene = initialScene
  , started = False }
