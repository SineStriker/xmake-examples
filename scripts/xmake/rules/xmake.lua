-- abstract binary rule
rule("std.bin.clean")
    after_clean(function (target)
        os.rm(target:targetdir() .. "/" .. path.basename(target:targetfile()) .. ".*")
    end)
rule_end()

-- executable rule
rule("std.exe")
    on_load(function (target)
        target:set("kind", "binary")
        target:set("targetdir", get_config("xmake_runtime_output_dir"))
    end)

    add_deps("std.bin.clean")
rule_end()

-- static library rule
rule("std.lib")
    on_load(function (target)
        target:set("kind", "static")
        target:set("targetdir", get_config("xmake_library_output_dir"))
    end)

    add_deps("std.bin.clean")
rule_end()

-- shared library rule
rule("std.dll")
    on_load(function (target)
        target:set("kind", "shared")
        if os.host() == "windows" then
            target:set("targetdir", get_config("xmake_runtime_output_dir"))
        else 
            target:set("targetdir", get_config("xmake_library_output_dir"))
        end
    end)

    add_deps("std.bin.clean")
rule_end()