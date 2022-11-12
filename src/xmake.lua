-- project
set_project("xmake-shared")
set_version("0.0.1")

-- set ouput dir
set_config("xmake_runtime_output_dir", "$(buildir)/bin")
set_config("xmake_library_output_dir", "$(buildir)/lib")

-- add library
includes("libshared")

-- add executable
target("main")
    add_rules("std.exe")

    -- add files
    add_files("main.c")

    -- add link libraries
    add_deps("libshared")
target_end()
