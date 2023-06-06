interface I32Series
    exposes [I32Series, fromListAndName, getName, toList, len, get]
    imports []

I32Series := { name : Str, data : List I32 }

fromListAndName : List I32, Str -> I32Series
fromListAndName = \data, name ->
    @I32Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @I32Series { name: "test", data : [] }

getName : I32Series -> Str
getName = \@I32Series { name } ->
    name

toList : I32Series -> List I32
toList = \@I32Series { data } ->
    data

len : I32Series -> Nat
len = \series ->
    series |> toList |> List.len

get : I32Series, Nat -> Result I32 [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
