interface U32Series
    exposes [U32Series, fromListAndName, getName, toList, len, get]
    imports []

U32Series := { name : Str, data : List U32 }

fromListAndName : List U32, Str -> U32Series
fromListAndName = \data, name ->
    @U32Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @U32Series { name: "test", data : [] }

getName : U32Series -> Str
getName = \@U32Series { name } ->
    name

toList : U32Series -> List U32
toList = \@U32Series { data } ->
    data

len : U32Series -> Nat
len = \series ->
    series |> toList |> List.len

get : U32Series, Nat -> Result U32 [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
