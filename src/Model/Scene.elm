module Model.Scene exposing (..)

import Model.Compound exposing (..)


type alias Scene =
  { compound : Compound
  , seed : Int }


initialScene : Scene
initialScene =
  { compound = Compound "enten" "gesicht"
  , seed = 0 }
