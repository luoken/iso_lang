# IsoLang

IsoLang is a package for converting between ISO-639-1, ISO-639-2T, ISO-639-2B codes and the human readable name. 

## Usage
```elixir
iex> IsoLang.all()
[
  %IsoLang{alpha2: "aa", alpha3b: "aar", alpha3t: "", name: "Afar"},
  %IsoLang{alpha2: "ab", alpha3b: "abk", alpha3t: "", name: "Abkhazian"},
  %IsoLang{alpha2: "", alpha3b: "ace", alpha3t: "", name: "Achinese"},
  %IsoLang{alpha2: "", alpha3b: "ach", alpha3t: "", name: "Acoli"},
  %IsoLang{alpha2: "", alpha3b: "ada", alpha3t: "", name: "Adangme"},
  # ... etc...
]


```elixir
iex> IsoLang.get("de")
{:ok, %IsoLang{alpha2: "de", alpha3b: "ger", alpha3t: "deu", name: "German"}}
```

```

## Installation

```elixir
def deps do
  [
    {:iso_lang, "~> 0.1.0"}
  ]
end
```

## See Also
- https://en.wikipedia.org/wiki/IETF_language_tag
- https://tools.ietf.org/search/bcp47
- https://datahub.io/core/language-codes#resource-language-codes-full