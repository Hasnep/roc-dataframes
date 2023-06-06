interface BoolSeries
    exposes [BoolSeries, fromListAndName, getName, toList, len, get]
    imports []

BoolSeries := { name : Str, data : List Bool }

fromListAndName : List Bool, Str -> BoolSeries
fromListAndName = \data, name ->
    @BoolSeries { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @BoolSeries { name: "test", data : [] }

getName : BoolSeries -> Str
getName = \@BoolSeries { name } ->
    name

toList : BoolSeries -> List Bool
toList = \@BoolSeries { data } ->
    data

len : BoolSeries -> Nat
len = \series ->
    series |> toList |> List.len

get : BoolSeries, Nat -> Result Bool [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
