# IsoLang

`IsoLang` is a package for converting between ISO-639-1, ISO-639-2T, ISO-639-2B codes and the human readable name.

## Usage

```elixir
iex> IsoLang.all()
[
  %IsoLang{
    alpha2: "aa",
    alpha3b: "aar",
    alpha3t: "",
    name: "Afar",
    native_name: "Afaraf"
  },
  %IsoLang{
    alpha2: "ab",
    alpha3b: "abk",
    alpha3t: "",
    name: "Abkhazian",
    native_name: "аҧсуа бызшәа"
  },
  # ... etc...
]

# To get a single language, use `IsoLang.get/2` or its `!` counterpart.
# This will seek a match by examining the attributes `:alpha2`, `:alpha3b`, 
# `:alpha3t`, `:name` in that order:
iex> IsoLang.get("de")
{:ok,
 %IsoLang{
   alpha2: "de",
   alpha3b: "ger",
   alpha3t: "deu",
   name: "German",
   native_name: "Deutsch"
 }}

# Or to search just a single field, include the `:by` argument (capitalization matters):
iex(1)> IsoLang.get("French")
{:ok,%IsoLang{
   alpha2: "fr",
   alpha3b: "fre",
   alpha3t: "fra",
   name: "French",
   native_name: "Français"
 }}
```

Or search for matching languages using `IsoLang.find/2`:

```elixir
iex> IsoLang.find("eng")
{:ok,
  [
    %IsoLang{alpha2: "bn", alpha3b: "ben", alpha3t: "", name: "Bengali"},
    %IsoLang{alpha2: "en", alpha3b: "eng", alpha3t: "", name: "English"}
  ]}
```

The `native_name`s of the languages are translated via `gettext`: if you you need to display the names of languages in a specific language, you may add a dedicated `.po` file.

## Installation

```elixir
def deps do
  [
    {:iso_lang, "~> 0.3.1"}
  ]
end
```

## See Also

- <https://en.wikipedia.org/wiki/IETF_language_tag>
- <https://tools.ietf.org/search/bcp47>
- <https://datahub.io/core/language-codes#resource-language-codes-full>
