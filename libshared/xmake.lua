-- xmake minimum
set_xmakever("2.7.2")

-- project
set_project("libshared")
set_version("0.0.1")

-- libshared config
set_config("libshared_build_static", false)

target("libshared")
    if is_config("libshared_build_static", true) then
        set_kind("static")
    else
        set_kind("shared")
    end
    
    -- add files
    add_files("src/*.cpp")

    -- add static macro
    if is_config("libshared_build_static", true) then
        add_defines("LIBSHARED_STATIC", {public = true})
    end

    -- add library private macro
    add_defines("LIBSHARED_LIBRARY", {private = true})

    -- include dirs
    add_includedirs("include", {public = true})