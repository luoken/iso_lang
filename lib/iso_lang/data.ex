defmodule IsoLang.Data do
  @moduledoc """
  Builds list of language codes at compile-time.

  Data sourced from https://datahub.io/core/language-codes#resource-language-codes-full
  Native language names adapted from https://github.com/meikidd/iso-639-1/blob/master/src/data.js
  """

  # External resource used by this module
  # https://hexdocs.pm/elixir/Module.html#module-external_resource
  @external_resource Application.app_dir(:iso_lang, ["priv", "language-codes-full.csv"])

  native_names = %{
    "aa" => "Afaraf",
    "ab" => "аҧсуа бызшәа",
    "ae" => "avesta",
    "af" => "Afrikaans",
    "ak" => "Akan",
    "am" => "አማርኛ",
    "an" => "aragonés",
    "ar" => "اَلْعَرَبِيَّةُ",
    "as" => "অসমীয়া",
    "av" => "авар мацӀ",
    "ay" => "aymar aru",
    "az" => "azərbaycan dili",
    "ba" => "башҡорт теле",
    "be" => "беларуская мова",
    "bg" => "български език",
    "bi" => "Bislama",
    "bm" => "bamanankan",
    "bn" => "বাংলা",
    "bo" => "བོད་ཡིག",
    "br" => "brezhoneg",
    "bs" => "bosanski jezik",
    "ca" => "Català",
    "ce" => "нохчийн мотт",
    "ch" => "Chamoru",
    "co" => "corsu",
    "cr" => "ᓀᐦᐃᔭᐍᐏᐣ",
    "cs" => "čeština",
    "cu" => "ѩзыкъ словѣньскъ",
    "cv" => "чӑваш чӗлхи",
    "cy" => "Cymraeg",
    "da" => "dansk",
    "de" => "Deutsch",
    "dv" => "ދިވެހި",
    "dz" => "རྫོང་ཁ",
    "ee" => "Eʋegbe",
    "el" => "Ελληνικά",
    "en" => "English",
    "eo" => "Esperanto",
    "es" => "Español",
    "et" => "eesti",
    "eu" => "euskara",
    "fa" => "فارسی",
    "ff" => "Fulfulde",
    "fi" => "suomi",
    "fj" => "vosa Vakaviti",
    "fo" => "føroyskt",
    "fr" => "Français",
    "fy" => "Frysk",
    "ga" => "Gaeilge",
    "gd" => "Gàidhlig",
    "gl" => "galego",
    "gn" => "Avañe'ẽ",
    "gu" => "ગુજરાતી",
    "gv" => "Gaelg",
    "ha" => "هَوُسَ",
    "he" => "עברית",
    "hi" => "हिन्दी",
    "ho" => "Hiri Motu",
    "hr" => "Hrvatski",
    "ht" => "Kreyòl ayisyen",
    "hu" => "magyar",
    "hy" => "Հայերեն",
    "hz" => "Otjiherero",
    "ia" => "Interlingua",
    "id" => "Bahasa Indonesia",
    "ie" => "Interlingue",
    "ig" => "Asụsụ Igbo",
    "ii" => "ꆈꌠ꒿ Nuosuhxop",
    "ik" => "Iñupiaq",
    "io" => "Ido",
    "is" => "Íslenska",
    "it" => "Italiano",
    "iu" => "ᐃᓄᒃᑎᑐᑦ",
    "ja" => "日本語",
    "jv" => "basa Jawa",
    "ka" => "ქართული",
    "kg" => "Kikongo",
    "ki" => "Gĩkũyũ",
    "kj" => "Kuanyama",
    "kk" => "қазақ тілі",
    "kl" => "kalaallisut",
    "km" => "ខេមរភាសា",
    "kn" => "ಕನ್ನಡ",
    "ko" => "한국어",
    "kr" => "Kanuri",
    "ks" => "कश्मीरी",
    "ku" => "Kurdî",
    "kv" => "коми кыв",
    "kw" => "Kernewek",
    "ky" => "Кыргызча",
    "la" => "latine",
    "lb" => "Lëtzebuergesch",
    "lg" => "Luganda",
    "li" => "Limburgs",
    "ln" => "Lingála",
    "lo" => "ພາສາລາວ",
    "lt" => "lietuvių kalba",
    "lu" => "Kiluba",
    "lv" => "latviešu valoda",
    "mg" => "fiteny malagasy",
    "mh" => "Kajin M̧ajeļ",
    "mi" => "te reo Māori",
    "mk" => "македонски јазик",
    "ml" => "മലയാളം",
    "mn" => "Монгол хэл",
    "mr" => "मराठी",
    "ms" => "Bahasa Melayu",
    "mt" => "Malti",
    "my" => "ဗမာစာ",
    "na" => "Dorerin Naoero",
    "nb" => "Norsk bokmål",
    "nd" => "isiNdebele",
    "ne" => "नेपाली",
    "ng" => "Owambo",
    "nl" => "Nederlands",
    "nn" => "Norsk nynorsk",
    "no" => "Norsk",
    "nr" => "isiNdebele",
    "nv" => "Diné bizaad",
    "ny" => "chiCheŵa",
    "oc" => "occitan",
    "oj" => "ᐊᓂᔑᓈᐯᒧᐎᓐ",
    "om" => "Afaan Oromoo",
    "or" => "ଓଡ଼ିଆ",
    "os" => "ирон æвзаг",
    "pa" => "ਪੰਜਾਬੀ",
    "pi" => "पाऴि",
    "pl" => "Polski",
    "ps" => "پښتو",
    "pt" => "Português",
    "qu" => "Runa Simi",
    "rm" => "rumantsch grischun",
    "rn" => "Ikirundi",
    "ro" => "Română",
    "ru" => "Русский",
    "rw" => "Ikinyarwanda",
    "sa" => "संस्कृतम्",
    "sc" => "sardu",
    "sd" => "सिन्धी",
    "se" => "Davvisámegiella",
    "sg" => "yângâ tî sängö",
    "si" => "සිංහල",
    "sk" => "slovenčina",
    "sl" => "slovenščina",
    "sm" => "gagana fa'a Samoa",
    "sn" => "chiShona",
    "so" => "Soomaaliga",
    "sq" => "Shqip",
    "sr" => "српски језик",
    "ss" => "SiSwati",
    "st" => "Sesotho",
    "su" => "Basa Sunda",
    "sv" => "Svenska",
    "sw" => "Kiswahili",
    "ta" => "தமிழ்",
    "te" => "తెలుగు",
    "tg" => "тоҷикӣ",
    "th" => "ไทย",
    "ti" => "ትግርኛ",
    "tk" => "Türkmençe",
    "tl" => "Wikang Tagalog",
    "tn" => "Setswana",
    "to" => "faka Tonga",
    "tr" => "Türkçe",
    "ts" => "Xitsonga",
    "tt" => "татар теле",
    "tw" => "Twi",
    "ty" => "Reo Tahiti",
    "ug" => "ئۇيغۇرچە‎",
    "uk" => "Українська",
    "ur" => "اردو",
    "uz" => "Ўзбек",
    "ve" => "Tshivenḓa",
    "vi" => "Tiếng Việt",
    "vo" => "Volapük",
    "wa" => "walon",
    "wo" => "Wollof",
    "xh" => "isiXhosa",
    "yi" => "ייִדיש",
    "yo" => "Yorùbá",
    "za" => "Saɯ cueŋƅ",
    "zh" => "中文",
    "zu" => "isiZulu"
  }

  lines =
    @external_resource
    |> File.stream!()
    |> Stream.drop(1)

  langs =
    Enum.map(lines, fn l ->
      [alpha3b, alpha3t, alpha2 | rest] =
        l
        |> String.trim()
        |> String.split(",")

      tail = Enum.join(rest, ",")

      # Parse up to the closing double-quote or up to the comma
      f = fn
        <<?", chunk::binary>> ->
          Regex.run(~r/(.*)"/U, chunk, capture: :all_but_first) |> Enum.at(0)

        chunk ->
          Regex.run(~r/(.*),/U, chunk, capture: :all_but_first) |> Enum.at(0)
      end

      %IsoLang{
        alpha2: alpha2,
        alpha3b: alpha3b,
        alpha3t: alpha3t,
        name: Gettext.gettext(IsoLang, f.(tail)),
        native_name: Map.get(native_names, alpha2)
      }
    end)

  def all(_opts) do
    unquote(Macro.escape(langs))
  end
end
