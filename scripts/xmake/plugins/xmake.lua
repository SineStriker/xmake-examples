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