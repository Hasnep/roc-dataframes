interface I64Series
    exposes [I64Series, fromListAndName, getName, toList, len, get]
    imports []

I64Series := { name : Str, data : List I64 }

fromListAndName : List I64, Str -> I64Series
fromListAndName = \data, name ->
    @I64Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @I64Series { name: "test", data : [] }

getName : I64Series -> Str
getName = \@I64Series { name } ->
    name

toList : I64Series -> List I64
toList = \@I64Series { data } ->
    data

len : I64Series -> Nat
len = \series ->
    series |> toList |> List.len

get : I64Series, Nat -> Result I64 [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
