-- project
set_project("qtwidgets")
set_version("0.0.1")

-- set ouput dir
set_config("xmake_runtime_output_dir", "$(buildir)/bin")
set_config("xmake_library_output_dir", "$(buildir)/lib")

-- add executable
target("qtwidgets")
    add_rules("qt.widgetapp", "std.exe")

    -- add files
    add_files("main.cpp")

    -- add frameworks
    add_frameworks("QtSvg")
target_end()
