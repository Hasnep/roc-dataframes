interface OptionalI32Series
    exposes [OptionalI32Series, fromListAndName, getName, toList, len, get]
    imports []

OptionalI32Series := { name : Str, data : List [Some I32, None] }

fromListAndName : List [Some I32, None], Str -> OptionalI32Series
fromListAndName = \data, name ->
    @OptionalI32Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @OptionalI32Series { name: "test", data : [] }

getName : OptionalI32Series -> Str
getName = \@OptionalI32Series { name } ->
    name

toList : OptionalI32Series -> List [Some I32, None]
toList = \@OptionalI32Series { data } ->
    data

len : OptionalI32Series -> Nat
len = \series ->
    series |> toList |> List.len

get : OptionalI32Series, Nat -> Result [Some I32, None] [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
