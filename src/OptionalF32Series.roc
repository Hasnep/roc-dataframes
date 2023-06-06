interface OptionalF32Series
    exposes [OptionalF32Series, fromListAndName, getName, toList, len, get]
    imports []

OptionalF32Series := { name : Str, data : List [Some F32, None] }

fromListAndName : List [Some F32, None], Str -> OptionalF32Series
fromListAndName = \data, name ->
    @OptionalF32Series { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @OptionalF32Series { name: "test", data : [] }

getName : OptionalF32Series -> Str
getName = \@OptionalF32Series { name } ->
    name

toList : OptionalF32Series -> List [Some F32, None]
toList = \@OptionalF32Series { data } ->
    data

len : OptionalF32Series -> Nat
len = \series ->
    series |> toList |> List.len

get : OptionalF32Series, Nat -> Result [Some F32, None] [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
