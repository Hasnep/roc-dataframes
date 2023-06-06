interface U64Series
    exposes [U64Series, fromListAndName, getName, toList, len, get]
    imports []

U64Series := { name : Str, data : List U64 }

fromListAndName : List U64, Str -> U64Series
fromListAndName = \data, name ->
    @U64Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @U64Series { name: "test", data : [] }

getName : U64Series -> Str
getName = \@U64Series { name } ->
    name

toList : U64Series -> List U64
toList = \@U64Series { data } ->
    data

len : U64Series -> Nat
len = \series ->
    series |> toList |> List.len

get : U64Series, Nat -> Result U64 [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
