interface F32Series
    exposes [F32Series, fromListAndName, getName, toList, len, get]
    imports []

F32Series := { name : Str, data : List F32 }

fromListAndName : List F32, Str -> F32Series
fromListAndName = \data, name ->
    @F32Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @F32Series { name: "test", data : [] }

getName : F32Series -> Str
getName = \@F32Series { name } ->
    name

toList : F32Series -> List F32
toList = \@F32Series { data } ->
    data

len : F32Series -> Nat
len = \series ->
    series |> toList |> List.len

get : F32Series, Nat -> Result F32 [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
