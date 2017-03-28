module Subscription exposing (..)

import Model exposing (..)


type Msg
  = Start
  | Mutate MutationTarget


type MutationTarget
  = Part1 | Part2


subscriptions : Model -> Sub Msg
subscriptions {scene} =
  Sub.batch []
