IncludeDirs = {}
IncludeDirs["SFML"] = g_WorkspaceFolder .. "/../Third/SFML-2.5.1/include"

project "SFML"
    kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
    
    -- Place where build files will be generated
    location (g_BuildFolder .. "/%{prj.name}")
    -- Place where compiled binary target
    targetdir (g_WorkspaceFolder .. "/../bin/%{prj.name}")
    -- Place where object and other intermediate files
    objdir (g_WorkspaceFolder .. "/../bin-int/%{prj.name}")

    -- Specify script files for the project
    files
    {
        g_WorkspaceFolder .. "/%{prj.name}/Source/**.h",
        g_WorkspaceFolder .. "/%{prj.name}/Source/**.cpp",
    }

    -- Window configuration
    filter "system:windows"
        -- Specify the include file search path
        includedirs
        { 
            g_WorkspaceFolder .. "/%{prj.name}/Source/",
            "%{IncludeDirs.SFML}"
        }
        -- Specify the library file search path
        libdirs { g_WorkspaceFolder .. "/../Third/SFML-2.5.1/lib/%{cfg.system}/%{cfg.architecture}" }
    
        -- Copy dlls
        prebuildcommands 
        {
            ("{COPY} \"%{wks.location}../Third/SFML-2.5.1/bin/%{cfg.system}/%{cfg.architecture}/*.dll\" \"%{cfg.buildtarget.directory}\"")
        }

    filter { "system:windows", "configurations:Debug" }
        links   { "sfml-system-d.lib", "sfml-window-d.lib", "sfml-graphics-d.lib" }

    filter { "system:windows", "configurations:Release" }
        links   { "sfml-system.lib","sfml-window.lib", "sfml-graphics.lib" }

    -- Mac configuration
    filter "system:macosx"
        systemversion "10.14"   -- 我的Mac版本是10.14.5，低于development target的10.15， 为了避免手动修改，改成10.14
        includedirs     { g_WorkspaceFolder .. "/%{prj.name}/Source/" }-- Xcode: User Header Search Paths
        sysincludedirs  { "%{IncludeDirs.SFML}" }--Xcode: Header Search Paths
        links           { "sfml-system.framework", "sfml-window.framework", "sfml-graphics.framework", "freetype.framework" }
        linkoptions 
        { 
            "-F" .. g_WorkspaceFolder .. "/../Third/SFML-2.5.1/lib/%{cfg.system}/Frameworks",
            "-Xlinker -rpath -Xlinker " .. g_WorkspaceFolder .. "/../Third/SFML-2.5.1/lib/%{cfg.system}/Frameworks"
        }

        --syslibdirs      { g_WorkspaceFolder .. "/../Third/SFML-2.5.1/lib/%{cfg.system}/Frameworks" }
        --libdirs      { g_WorkspaceFolder .. "/../Third/SFML-2.5.1/lib/%{cfg.system}/Frameworks" }
        -- runpathdirs     
        -- { 
        --     g_WorkspaceFolder .. "/../bin/%{prj.name}",
        --     g_WorkspaceFolder .. "/../Third/SFML-2.5.1/lib/%{cfg.system}/Frameworks",
        --     g_WorkspaceFolder .. "/../Third/SFML-2.5.1/lib/%{cfg.system}/extlibs"
        -- }
        -- prebuildcommands
        -- {
        --     ("{COPY} \"%{wks.location}/../Third/SFML-2.5.1/lib/%{cfg.system}/Frameworks/sfml-system.framework\" \"%{cfg.buildtarget.directory}\""),
        --     ("{COPY} \"%{wks.location}/../Third/SFML-2.5.1/lib/%{cfg.system}/Frameworks/sfml-window.framework\" \"%{cfg.buildtarget.directory}\""),
        --     ("{COPY} \"%{wks.location}/../Third/SFML-2.5.1/lib/%{cfg.system}/Frameworks/sfml-graphics.framework\" \"%{cfg.buildtarget.directory}\""),
        --     ("{COPY} \"%{wks.location}/../Third/SFML-2.5.1/lib/%{cfg.system}/Frameworks/freetype.framework\" \"%{cfg.buildtarget.directory}\"")
        -- }