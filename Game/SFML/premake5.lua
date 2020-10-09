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
        includedirs     { g_WorkspaceFolder .. "/%{prj.name}/Source/" }--Xcode: User Header Search Paths