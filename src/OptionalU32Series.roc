interface OptionalU32Series
    exposes [OptionalU32Series, fromListAndName, getName, toList, len, get]
    imports []

OptionalU32Series := { name : Str, data : List [Some U32, None] }

fromListAndName : List [Some U32, None], Str -> OptionalU32Series
fromListAndName = \data, name ->
    @OptionalU32Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @OptionalU32Series { name: "test", data : [] }

getName : OptionalU32Series -> Str
getName = \@OptionalU32Series { name } ->
    name

toList : OptionalU32Series -> List [Some U32, None]
toList = \@OptionalU32Series { data } ->
    data

len : OptionalU32Series -> Nat
len = \series ->
    series |> toList |> List.len

get : OptionalU32Series, Nat -> Result [Some U32, None] [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
