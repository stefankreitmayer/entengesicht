module Update exposing (..)

import Model exposing (..)
import Model.Scene exposing (..)
import Model.Compound exposing (..)
import Subscription exposing (..)
import Interop exposing (..)

import Debug exposing (log)


update : Msg -> Model -> (Model, Cmd Msg)
update action ({scene} as model) =
  case action of
    Mutate target ->
      let
          seed = scene.seed
          (part1_, part2_) =
            case target of
              Part1 ->
                (pick seed part1Vocabulary, scene.compound.part2)

              Part2 ->
                (scene.compound.part1, pick seed part2Vocabulary)

          compound_ = Compound part1_ part2_
          scene_ = { scene | compound = compound_
                           , seed = scene.seed + 1 }
          speechOutput = glue compound_
      in
          ({ model | scene = scene_ }, speak speechOutput)


pick : Int -> List String -> String
pick seed vocabulary =
  let
      index = seed % (List.length vocabulary)
  in
      List.drop index vocabulary
      |> List.head
      |> Maybe.withDefault "kopf"


part1Vocabulary : List String
part1Vocabulary =
  [ "raketen", "erkenntnis", "tassen", "düsen", "rest", "sonder", "multiplikations", "blitz", "dienst", "würden", "pflicht", "straf", "ablenk", "spring", "brot", "gratis", "überraschungs", "schweine", "makrelen", "parallel", "not", "musik", "doppel", "wurzel", "rüben", "bazillen", "piraten", "business", "gesellschafts", "halb", "teleportations", "pilz", "schrumpf", "schreib", "purzel", "wunder", "eigen", "ober", "neben", "zauber", "wissenschafts", "raum", "karotten", "zeit", "glücks", "zitronen", "panda", "lust", "kampf", "dosen", "schnell", "billig", "zwangs", "schnabel", "verzweiflungs", "fehl", "mitleids" ]


part2Vocabulary : List String
part2Vocabulary =
  [ "katapult", "gewinn", "nase", "kaffee", "kutter", "gemüse", "schleuder", "getriebe", "tier", "wampe", "blick", "verrenkung", "gewohnheit", "geständnis", "fehler", "entscheidung", "zeugnis", "fackel", "schinken", "drossel", "bude", "schnute", "kaspar", "matratze", "gedöns", "lampe", "ereignis", "kopf", "artikel", "fürsorge", "übertragung", "zeit", "raum", "vermächtnis", "salon", "hose", "bereitschaft", "verzicht", "verehrung", "erklärung", "bedürfnis", "jacke", "zweck" ]
