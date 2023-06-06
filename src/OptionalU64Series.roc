interface OptionalU64Series
    exposes [OptionalU64Series, fromListAndName, getName, toList, len, get]
    imports []

OptionalU64Series := { name : Str, data : List [Some U64, None] }

fromListAndName : List [Some U64, None], Str -> OptionalU64Series
fromListAndName = \data, name ->
    @OptionalU64Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @OptionalU64Series { name: "test", data : [] }

getName : OptionalU64Series -> Str
getName = \@OptionalU64Series { name } ->
    name

toList : OptionalU64Series -> List [Some U64, None]
toList = \@OptionalU64Series { data } ->
    data

len : OptionalU64Series -> Nat
len = \series ->
    series |> toList |> List.len

get : OptionalU64Series, Nat -> Result [Some U64, None] [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
