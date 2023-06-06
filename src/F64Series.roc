interface F64Series
    exposes [F64Series, fromListAndName, getName, toList, len, get]
    imports []

F64Series := { name : Str, data : List F64 }

fromListAndName : List F64, Str -> F64Series
fromListAndName = \data, name ->
    @F64Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @F64Series { name: "test", data : [] }

getName : F64Series -> Str
getName = \@F64Series { name } ->
    name

toList : F64Series -> List F64
toList = \@F64Series { data } ->
    data

len : F64Series -> Nat
len = \series ->
    series |> toList |> List.len

get : F64Series, Nat -> Result F64 [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
