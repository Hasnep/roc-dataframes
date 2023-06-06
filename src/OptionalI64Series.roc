interface OptionalI64Series
    exposes [OptionalI64Series, fromListAndName, getName, toList, len, get]
    imports []

OptionalI64Series := { name : Str, data : List [Some I64, None] }

fromListAndName : List [Some I64, None], Str -> OptionalI64Series
fromListAndName = \data, name ->
    @OptionalI64Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @OptionalI64Series { name: "test", data : [] }

getName : OptionalI64Series -> Str
getName = \@OptionalI64Series { name } ->
    name

toList : OptionalI64Series -> List [Some I64, None]
toList = \@OptionalI64Series { data } ->
    data

len : OptionalI64Series -> Nat
len = \series ->
    series |> toList |> List.len

get : OptionalI64Series, Nat -> Result [Some I64, None] [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
