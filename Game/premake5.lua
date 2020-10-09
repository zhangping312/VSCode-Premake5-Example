-- Custom variables
g_WorkspaceFolder = os.getcwd()
g_BuildFolder = g_WorkspaceFolder .. "/../build"
print("g_WorkspaceFolder: " .. g_WorkspaceFolder)
print("g_BuildFolder: " .. g_BuildFolder)

-- Workspace configuration:
workspace "Game"
    -- Place where build files will be generated
    location "../build"
    -- Available configurations and platforms
    configurations { "Debug", "Release" }
    filter "system:windows"
        platforms { "x86", "x64" }
    filter "system:not windows"
        platforms { "x64" }

    filter "system:windows"
        systemversion "latest"
        
    -- Setup platforms
    filter "platforms:x86"
        architecture "x86"
    filter "platforms:x64"
        architecture "x86_64"
    
    -- Setup configurations
    filter "configurations:Debug"
        symbols "On"
    filter "configurations:Release"
        optimize "On"

    -- Add projects
    include("SFML/premake5.lua")