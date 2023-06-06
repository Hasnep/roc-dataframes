interface OptionalF64Series
    exposes [OptionalF64Series, fromListAndName, getName, toList, len, get]
    imports []

OptionalF64Series := { name : Str, data : List [Some F64, None] }

fromListAndName : List [Some F64, None], Str -> OptionalF64Series
fromListAndName = \data, name ->
    @OptionalF64Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @OptionalF64Series { name: "test", data : [] }

getName : OptionalF64Series -> Str
getName = \@OptionalF64Series { name } ->
    name

toList : OptionalF64Series -> List [Some F64, None]
toList = \@OptionalF64Series { data } ->
    data

len : OptionalF64Series -> Nat
len = \series ->
    series |> toList |> List.len

get : OptionalF64Series, Nat -> Result [Some F64, None] [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
