-- xmake minimum
set_xmakever("2.7.2")

-- generate compile commands
task("f2")
    on_run(function()
        import("core.base.task")
        import("core.project.config")

        -- generate compile commands
        task.run("project", { kind = "compile_commands", outputdir = config.buildir() })
    end)

    set_menu {
        usage = "xmake f2"
        , description = "Run config and generate compile commands to build dir."
        , options = {}
    }

task_end()

-- project
set_project("xmake-shared")
set_version("0.0.1")

-- add library
includes("libshared")

-- add executable
target("main")
    set_kind("binary")

    -- add files
    add_files("main.c")

    -- add link libraries
    add_deps("libshared")