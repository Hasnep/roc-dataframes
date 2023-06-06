interface OptionalBoolSeries
    exposes [OptionalBoolSeries, fromListAndName, getName, toList, len, get]
    imports []

OptionalBoolSeries := { name : Str, data : List [Some Bool, None] }

fromListAndName : List [Some Bool, None], Str -> OptionalBoolSeries
fromListAndName = \data, name ->
    @OptionalBoolSeries { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @OptionalBoolSeries { name: "test", data : [] }

getName : OptionalBoolSeries -> Str
getName = \@OptionalBoolSeries { name } ->
    name

toList : OptionalBoolSeries -> List [Some Bool, None]
toList = \@OptionalBoolSeries { data } ->
    data

len : OptionalBoolSeries -> Nat
len = \series ->
    series |> toList |> List.len

get : OptionalBoolSeries, Nat -> Result [Some Bool, None] [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
