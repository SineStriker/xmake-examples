-- abstract binary rule
rule("std.bin.clean")
    after_clean(function (target)
        os.rm(target:targetdir() .. "/" .. path.basename(target:targetfile()) .. ".*")
    end)
rule_end()

-- executable rule
rule("std.exe")
    on_load(function (target)
        -- cprint("%s: executable", target:name())
        target:set("kind", "binary")
        if has_config("xmake_runtime_output_dir") then
            target:set("targetdir", get_config("xmake_runtime_output_dir"))
        end
    end)

    add_deps("std.bin.clean")
rule_end()

-- static library rule
rule("std.lib")
    on_load(function (target)
        -- cprint("%s: static", target:name())
        target:set("kind", "static")
        if has_config("xmake_library_output_dir") then
            target:set("targetdir", get_config("xmake_library_output_dir"))
        end
    end)

    add_deps("std.bin.clean")
rule_end()

-- shared library rule
rule("std.dll")
    on_load(function (target)
        -- cprint("%s: shared", target:name())
        target:set("kind", "shared")
        if os.host() == "windows" then
            if has_config("xmake_runtime_output_dir") then
                target:set("targetdir", get_config("xmake_runtime_output_dir"))
            end
        else 
            if has_config("xmake_library_output_dir") then
                target:set("targetdir", get_config("xmake_library_output_dir"))
            end
        end
    end)

    add_deps("std.bin.clean")
rule_end()