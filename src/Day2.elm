module Day2 exposing (view)

import Array exposing (..)
import Html exposing (..)


view : Html msg
view =
    article []
        [ h2 [] [ text "Day 2" ]
        , p []
            [ text "Answer Part 1: "
            , text <|
                Maybe.withDefault "Something went wrong" <|
                    Maybe.map String.fromInt <|
                        Array.get 0 runIntCodeProgram
            ]
        , p [] [ text (String.join ", " <| Array.toList <| Array.map String.fromInt runIntCodeProgram) ]
        , p [] [ text "Answer Part 2: " ]
        , p []
            [ text "Output, puzzle solution: "
            , text (String.join ", " <| List.map String.fromInt (findMagicNumber 0 0))
            ]
        ]



-- PART 1


runIntCodeProgram : Array Int
runIntCodeProgram =
    runOpcode 0 (start intcodeProgram)


start : Array Int -> Array Int
start program =
    Array.set 2 2 <| Array.set 1 12 program


runOpcode : Int -> Array Int -> Array Int
runOpcode position program =
    case Array.get position program of
        Just 1 ->
            calculateOutput position (+) program

        Just 2 ->
            calculateOutput position (*) program

        Just 99 ->
            program

        _ ->
            Array.fromList []


calculateOutput : Int -> (Int -> Int -> Int) -> Array Int -> Array Int
calculateOutput currentPos function program =
    case
        ( Array.get (currentPos + 1) program
        , Array.get (currentPos + 2) program
        , Array.get (currentPos + 3) program
        )
    of
        ( Just inputPos1, Just inputPos2, Just outputPos ) ->
            setOutputValue ( inputPos1, inputPos2, outputPos ) function program
                |> runOpcode (currentPos + 4)

        _ ->
            Array.fromList []


setOutputValue : ( Int, Int, Int ) -> (Int -> Int -> Int) -> Array Int -> Array Int
setOutputValue ( inputPos1, inputPos2, outputPos ) function program =
    case
        ( Array.get inputPos1 program
        , Array.get inputPos2 program
        )
    of
        ( Just inputValue1, Just inputValue2 ) ->
            Array.set outputPos (function inputValue1 inputValue2) program

        _ ->
            Array.fromList []



-- PART 2


findMagicNumber : Int -> Int -> List Int
findMagicNumber noun verb =
    case
        Array.set 1 noun intcodeProgram
            |> Array.set 2 verb
            |> runOpcode 0
            |> Array.get 0
    of
        Just 19690720 ->
            [ 19690720, 100 * noun + verb ]

        Just _ ->
            let
                ( noun_, verb_ ) =
                    if noun <= 99 then
                        ( noun + 1, verb )

                    else
                        ( 0, verb + 1 )
            in
            findMagicNumber noun_ verb_

        Nothing ->
            []



-- PROGRAM


intcodeProgram : Array Int
intcodeProgram =
    Array.fromList
        [ 1
        , 0
        , 0
        , 3
        , 1
        , 1
        , 2
        , 3
        , 1
        , 3
        , 4
        , 3
        , 1
        , 5
        , 0
        , 3
        , 2
        , 1
        , 6
        , 19
        , 1
        , 9
        , 19
        , 23
        , 1
        , 6
        , 23
        , 27
        , 1
        , 10
        , 27
        , 31
        , 1
        , 5
        , 31
        , 35
        , 2
        , 6
        , 35
        , 39
        , 1
        , 5
        , 39
        , 43
        , 1
        , 5
        , 43
        , 47
        , 2
        , 47
        , 6
        , 51
        , 1
        , 51
        , 5
        , 55
        , 1
        , 13
        , 55
        , 59
        , 2
        , 9
        , 59
        , 63
        , 1
        , 5
        , 63
        , 67
        , 2
        , 67
        , 9
        , 71
        , 1
        , 5
        , 71
        , 75
        , 2
        , 10
        , 75
        , 79
        , 1
        , 6
        , 79
        , 83
        , 1
        , 13
        , 83
        , 87
        , 1
        , 10
        , 87
        , 91
        , 1
        , 91
        , 5
        , 95
        , 2
        , 95
        , 10
        , 99
        , 2
        , 9
        , 99
        , 103
        , 1
        , 103
        , 6
        , 107
        , 1
        , 107
        , 10
        , 111
        , 2
        , 111
        , 10
        , 115
        , 1
        , 115
        , 6
        , 119
        , 2
        , 119
        , 9
        , 123
        , 1
        , 123
        , 6
        , 127
        , 2
        , 127
        , 10
        , 131
        , 1
        , 131
        , 6
        , 135
        , 2
        , 6
        , 135
        , 139
        , 1
        , 139
        , 5
        , 143
        , 1
        , 9
        , 143
        , 147
        , 1
        , 13
        , 147
        , 151
        , 1
        , 2
        , 151
        , 155
        , 1
        , 10
        , 155
        , 0
        , 99
        , 2
        , 14
        , 0
        , 0
        ]
