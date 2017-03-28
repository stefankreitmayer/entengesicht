module Model.Compound exposing (..)

type alias Compound =
  { part1 : String
  , part2 : String }


glue : Compound -> String
glue {part1, part2} =
  part1 ++ part2
