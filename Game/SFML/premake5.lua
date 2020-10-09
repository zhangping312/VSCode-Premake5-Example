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
        includedirs { g_WorkspaceFolder .. "/%{prj.name}/Source/" }-- Specify the include file search path

    -- Mac configuration
    filter "system:macosx"
    systemversion "10.14"   -- 我的Mac版本是10.14.5，低于development target的10.15， 为了避免手动修改，改成10.14
        includedirs     { g_WorkspaceFolder .. "/%{prj.name}/Source/" }-- Xcode: User Header Search Paths