module Hello exposing (..)

import Html exposing (text)

--input = 9
input = 265149

{--  test function
1: 0,0,0 --> 1,0,1
2: 1,0,1 --> 1,1,1
3: 1,1,1 --> 0,1,1
4: 0,1,1 --> -1,1,1
5: -1,1,1 --> -1,0,1
6: -1,0,1 --> -1,-1,1
7: -1,-1,1 --> 0,-1,1
8: 0,-1,1 --> 1,-1,1
--}

addItemA (currX, currY, borderDistToCenter, currVal, expectedVal) = 
    let
        nextVal = currVal + 1
    in
        if (currX == borderDistToCenter) && (currY == -borderDistToCenter) && (currVal < expectedVal) then --move out
            addItemA (currX + 1, currY, borderDistToCenter + 1, nextVal, expectedVal)
        else if (currX == borderDistToCenter) && (currY < borderDistToCenter) && (currVal < expectedVal) then --move up
            addItemA (currX, currY + 1, borderDistToCenter, nextVal, expectedVal)
        else if (currX > -borderDistToCenter) && (currY == borderDistToCenter) && (currVal < expectedVal) then --move left
            addItemA (currX - 1, currY, borderDistToCenter, nextVal, expectedVal)
        else if (currX == -borderDistToCenter) && (currY > -borderDistToCenter) && (currVal < expectedVal) then --move down
            addItemA (currX, currY - 1, borderDistToCenter, nextVal, expectedVal)
        else if (currX < borderDistToCenter) && (currY == -borderDistToCenter) && (currVal < expectedVal) then --move right
            addItemA (currX + 1, currY, borderDistToCenter, nextVal, expectedVal)
        else
            "currVal: " ++ (toString currVal) ++ " currX: " ++ (toString currX) ++ " currY: " ++ (toString currY) ++ " borderDistToCenter: " ++ (toString borderDistToCenter)

addItemB (currX, currY, borderDistToCenter, currVal, expectedVal) = 
    let
        max = (borderDistToCenter * 2) + 1
        nextVal = currVal + 1
    in
        if (currX == borderDistToCenter) && (currY == -borderDistToCenter) && (currVal < expectedVal) then --move out
            addItemB (currX + 1, currY, borderDistToCenter + 1, nextVal, expectedVal)
        else if (currX == borderDistToCenter) && (currY < borderDistToCenter) && (currVal < expectedVal) then --move up
            addItemB (currX, currY + 1, borderDistToCenter, nextVal, expectedVal)
        else if (currX > -borderDistToCenter) && (currY == borderDistToCenter) && (currVal < expectedVal) then --move left
            addItemB (currX - 1, currY, borderDistToCenter, nextVal, expectedVal)
        else if (currX == -borderDistToCenter) && (currY > -borderDistToCenter) && (currVal < expectedVal) then --move down
            addItemB (currX, currY - 1, borderDistToCenter, nextVal, expectedVal)
        else if (currX < borderDistToCenter) && (currY == -borderDistToCenter) && (currVal < expectedVal) then --move right
            addItemB (currX + 1, currY, borderDistToCenter, nextVal, expectedVal)
        else
            "currVal: " ++ (toString currVal) ++ " currX: " ++ (toString currX) ++ " currY: " ++ (toString currY) ++ " borderDistToCenter: " ++ (toString borderDistToCenter)

--partA: retVal = addItemA (0,0,0,1,input)

retVal = addItemB (0,0,0,1,input)

    
main =
    --text "hello"
    text <| toString retVal