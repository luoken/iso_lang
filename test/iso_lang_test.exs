defmodule IsoLangTest do
  use ExUnit.Case

  describe "get/2" do
    test "Gets language when no standard is set" do
      assert {:ok, %IsoLang{alpha2: "de", alpha3b: "ger", alpha3t: "deu", name: "German"}} =
               IsoLang.get("de")
    end

    test "Gets language by alpha3b standard" do
      assert {:ok, %IsoLang{alpha2: "ko", alpha3b: "kor", alpha3t: "", name: "Korean"}} =
               IsoLang.get("kor", by: :alpha3b)
    end

    test "Gets language by alpha3t standard" do
      assert {:ok, %IsoLang{alpha2: "de", alpha3b: "ger", alpha3t: "deu", name: "German"}} =
               IsoLang.get("deu", by: :alpha3t)
    end

    test "Language automatically matches alpha3t" do
      assert {:ok, %IsoLang{alpha2: "de", alpha3b: "ger", alpha3t: "deu", name: "German"}} =
               IsoLang.get("deu")
    end

    test "Error when no language is found" do
      assert {:error, _} = IsoLang.get("invalid")
    end
  end

  describe "get!/2" do
    test "gets language when exists" do
      assert %IsoLang{alpha2: "de", alpha3b: "ger", alpha3t: "deu", name: "German"} =
               IsoLang.get!("de")
    end

    test "raises when no language is found" do
      assert_raise RuntimeError, fn -> IsoLang.get!("invalid") end
    end
  end

  describe "find/2" do
    test "Match partial names" do
      assert {:ok,
              [
                %IsoLang{
                  alpha2: "",
                  alpha3b: "ang",
                  alpha3t: "",
                  name: "English, Old (ca.450-1100)"
                },
                %IsoLang{alpha2: "bn", alpha3b: "ben", alpha3t: "", name: "Bengali"},
                %IsoLang{
                  alpha2: "",
                  alpha3b: "cpe",
                  alpha3t: "",
                  name: "Creoles and pidgins, English based"
                },
                %IsoLang{alpha2: "en", alpha3b: "eng", alpha3t: "", name: "English"},
                %IsoLang{
                  alpha2: "",
                  alpha3b: "enm",
                  alpha3t: "",
                  name: "English, Middle (1100-1500)"
                }
              ]} = IsoLang.find("eng")
    end

    test "Matches based on standard" do
      assert {:ok, [%IsoLang{alpha2: "ko", alpha3b: "kor", alpha3t: "", name: "Korean"}]} =
               IsoLang.find("ko", by: :alpha2)
    end

    test "Empty list when no match is found in standard" do
      assert {:ok, []} = IsoLang.find("eng", by: :alpha2)
    end
  end

  describe "find!/2" do
    test "match on partial names" do
      assert [
               %IsoLang{
                 alpha2: "",
                 alpha3b: "ang",
                 alpha3t: "",
                 name: "English, Old (ca.450-1100)"
               },
               %IsoLang{alpha2: "bn", alpha3b: "ben", alpha3t: "", name: "Bengali"},
               %IsoLang{
                 alpha2: "",
                 alpha3b: "cpe",
                 alpha3t: "",
                 name: "Creoles and pidgins, English based"
               },
               %IsoLang{alpha2: "en", alpha3b: "eng", alpha3t: "", name: "English"},
               %IsoLang{
                 alpha2: "",
                 alpha3b: "enm",
                 alpha3t: "",
                 name: "English, Middle (1100-1500)"
               }
             ] = IsoLang.find!("eng")
    end
  end
end
