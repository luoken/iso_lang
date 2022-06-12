################################################################################
# We generate the default PO file dynamically from the list of all available
# languages. This should only need to be done once when the repo is first
# created. If you need to recreate the default PO file for any reason, it's
# recommended that you delete the contents of the PO file before running this
# script: any errors or misquoted variables in it will cause the app to fail
# to compile.
################################################################################

  langs =
    IsoLang.all()
    |> Enum.map_join("\n", fn %{name: name} ->
      """
      msgid "#{name}"
      msgstr "#{name}"
      """
    end)

File.write!("priv/gettext/en/LC_MESSAGES/default.po", langs)
