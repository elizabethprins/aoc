module Day1 exposing (view)

import Html exposing (..)


type alias EngineModule =
    Int


view : Html msg
view =
    article []
        [ h2 [] [ text "Day 1" ]
        , p [] [ text "Sum of fuel requirements" ]
        , p [] [ text <| totalToString fuelRequired ]
        , p [] [ text "Sum of fuel requirements including mass of the added fuel" ]
        , p [] [ text <| totalToString fuelRequiredPlus ]
        ]


totalToString : (EngineModule -> Int) -> String
totalToString fuelCalculator =
    String.fromInt <| List.foldl ((+) << fuelCalculator) 0 engineModules


fuelRequired : EngineModule -> Int
fuelRequired engineModule =
    engineModule // 3 - 2


fuelRequiredPlus : EngineModule -> Int
fuelRequiredPlus engineModule =
    if fuelRequired engineModule <= 0 then
        0

    else
        fuelRequired engineModule + fuelRequiredPlus (fuelRequired engineModule)


engineModules : List EngineModule
engineModules =
    [ 84242
    , 87800
    , 131272
    , 84629
    , 105398
    , 91086
    , 99863
    , 146591
    , 58757
    , 51370
    , 108422
    , 95689
    , 91513
    , 113692
    , 79189
    , 113603
    , 52750
    , 123562
    , 147710
    , 145313
    , 98785
    , 86959
    , 89755
    , 97093
    , 62048
    , 98872
    , 145829
    , 76682
    , 65788
    , 119356
    , 124600
    , 69459
    , 80167
    , 56122
    , 117390
    , 72303
    , 141896
    , 140568
    , 82565
    , 75431
    , 54613
    , 124106
    , 104628
    , 78531
    , 63748
    , 139285
    , 111926
    , 101999
    , 53435
    , 57906
    , 58120
    , 146795
    , 147754
    , 79892
    , 65395
    , 121551
    , 50577
    , 122520
    , 66441
    , 86009
    , 121899
    , 71715
    , 112666
    , 112863
    , 140695
    , 54016
    , 78041
    , 91757
    , 130007
    , 89595
    , 142289
    , 149842
    , 136738
    , 70046
    , 89586
    , 142234
    , 142090
    , 147759
    , 85957
    , 136288
    , 86895
    , 131370
    , 71565
    , 128290
    , 95531
    , 110317
    , 115170
    , 56454
    , 71468
    , 113938
    , 64193
    , 115562
    , 73585
    , 81194
    , 92754
    , 105826
    , 104739
    , 137106
    , 104467
    , 120320
    ]
