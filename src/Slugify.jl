module Slugify
using JSON
export slugify

replacement = "-"

function slugify(str::AbstractString) :: String
    split_str = split(str)
    slugified_str = join(split_str, replacement)
    return replaceUnicode(slugified_str)
end

function slugify(str::AbstractString, replacement::String) :: String
    split_str = split(str)
    slugified_str = join(split_str, replacement)
    return replaceUnicode(slugified_str)
end

function replaceUnicode(str::String) :: String
    char_map_dict = JSON.parsefile("./config/char_map.json")
    str = reduce((s, kv) -> replace(s, kv[1] => kv[2]), char_map_dict, init=str)
    return str
end

end
