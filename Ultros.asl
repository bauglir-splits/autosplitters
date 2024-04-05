/*
v0.5 
    * Valid Start and Good Ending triggers!  Thanks @Hugo!
    * Expanded Shamans Connected options inline with Shamans Killed
*/

state("Ultros") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.LoadSceneManager = true;

    settings.Add("LoadRemoval", true, "Remove Load Times");
    settings.Add("SplitOn", true, "Split On");
        settings.Add("TestModes", false, "Test Modes", "SplitOn");
            settings.Add("ArrivedScene", false, "Enter ANY Scene", "TestModes");
            settings.Add("LeftScene", false, "Leave ANY Scene", "TestModes");
        settings.Add("LoopCount", false, "New Loop", "SplitOn");
        settings.Add("ShamansKilledCount", true, "Shamasal Killed By Count", "SplitOn");
            settings.Add("ShamansKilled1", false, "Killed 1 Shamasal", "ShamansKilledCount");
            settings.Add("ShamansKilled2", false, "Killed 2 Shamasal", "ShamansKilledCount");
            settings.Add("ShamansKilled3", false, "Killed 3 Shamasal", "ShamansKilledCount");
            settings.Add("ShamansKilled4", false, "Killed 4 Shamasal", "ShamansKilledCount");
            settings.Add("ShamansKilled5", false, "Killed 5 Shamasal", "ShamansKilledCount");
            settings.Add("ShamansKilled6", false, "Killed 6 Shamasal", "ShamansKilledCount");
            settings.Add("ShamansKilled7", false, "Killed 7 Shamasal", "ShamansKilledCount");
        settings.Add("ShamansKilledLocation", true, "Shamasal Killed By Location", "SplitOn");
            settings.Add("ShamanKilledGardnerGarden", false, "Gardner's Garden", "ShamansKilledLocation");
            settings.Add("ShamanKilledGeggamojaRefinery", false, "Geggamoja Refinery", "ShamansKilledLocation");
            settings.Add("ShamanKilledInfinityLake", false, "Infinity Lake", "ShamansKilledLocation");
            settings.Add("ShamanKilledPantheonOfTheStars", false, "Pantheon of the Stars", "ShamansKilledLocation");
            settings.Add("ShamanKilledRottenOrchard", false, "Rotten Orchard", "ShamansKilledLocation");
            settings.Add("ShamanKilledQualiasQuarters", false, "Temple of Motherhood", "ShamansKilledLocation");
            settings.Add("ShamanKilledVasasLegacy", false, "Vasa's Legacy", "ShamansKilledLocation");
        settings.Add("ShamansConnectedCount", true, "Shamasal Connected By Count", "SplitOn");
            settings.Add("ShamansConnected1", false, "Connected 1 Shamasal", "ShamansConnectedCount");
            settings.Add("ShamansConnected2", false, "Connected 2 Shamasal", "ShamansConnectedCount");
            settings.Add("ShamansConnected3", false, "Connected 3 Shamasal", "ShamansConnectedCount");
            settings.Add("ShamansConnected4", false, "Connected 4 Shamasal", "ShamansConnectedCount");
            settings.Add("ShamansConnected5", false, "Connected 5 Shamasal", "ShamansConnectedCount");
            settings.Add("ShamansConnected6", false, "Connected 6 Shamasal", "ShamansConnectedCount");
            settings.Add("ShamansConnected7", false, "Connected 7 Shamasal", "ShamansConnectedCount");
        settings.Add("ShamansConnectedLocation", true, "Shamasal Connected By Location", "SplitOn");
            settings.Add("ShamanConnectedGardnerGarden", false, "Gardner's Garden", "ShamansConnectedLocation");
            settings.Add("ShamanConnectedGeggamojaRefinery", false, "Geggamoja Refinery", "ShamansConnectedLocation");
            settings.Add("ShamanConnectedInfinityLake", false, "Infinity Lake", "ShamansConnectedLocation");
            settings.Add("ShamanConnectedPantheonOfTheStars", false, "Pantheon of the Stars", "ShamansConnectedLocation");
            settings.Add("ShamanConnectedRottenOrchard", false, "Rotten Orchard", "ShamansConnectedLocation");
            settings.Add("ShamanConnectedQualiasQuarters", false, "Temple of Motherhood", "ShamansConnectedLocation");
            settings.Add("ShamanConnectedVasasLegacy", false, "Vasa's Legacy", "ShamansConnectedLocation");
        settings.Add("ArrivedRegion", true, "Arrived at region", "SplitOn");
            settings.Add("ArrivedEntrance", false, "Entrance", "ArrivedRegion");
            settings.Add("ArrivedGardnerGarden", false, "Gardner's Garden", "ArrivedRegion");
            settings.Add("ArrivedGeggamojaRefinery", false, "Geggamoja Refinery", "ArrivedRegion");
            settings.Add("ArrivedInfinityLake", false, "Infinity Lake", "ArrivedRegion");
            settings.Add("ArrivedLivingQuarters", false, "Living Quarters", "ArrivedRegion");
            settings.Add("ArrivedPantheonOfTheStars", false, "Pantheon of the Stars", "ArrivedRegion");
            settings.Add("ArrivedRottenOrchard", false, "Rotten Orchard", "ArrivedRegion");
            settings.Add("ArrivedQualiasQuarters", false, "Temple of Motherhood", "ArrivedRegion");
            settings.Add("ArrivedVasasLegacy", false, "Vasa's Legacy", "ArrivedRegion");
        settings.Add("LeftRegion", true, "Left region", "SplitOn");
            settings.Add("LeftEntrance", false, "Entrance", "LeftRegion");
            settings.Add("LeftGardnerGarden", false, "Gardner's Garden", "LeftRegion");
            settings.Add("LeftGeggamojaRefinery", false, "Geggamoja Refinery", "LeftRegion");
            settings.Add("LeftInfinityLake", false, "Infinity Lake", "LeftRegion");
            settings.Add("LeftLivingQuarters", false, "Living Quarters", "LeftRegion");
            settings.Add("LeftPantheonOfTheStars", false, "Pantheon of the Stars", "LeftRegion");
            settings.Add("LeftRottenOrchard", false, "Rotten Orchard", "LeftRegion");
            settings.Add("LeftQualiasQuarters", false, "Temple of Motherhood", "LeftRegion");
            settings.Add("LeftVasasLegacy", false, "Vasa's Legacy", "LeftRegion");
        settings.Add("EscapeEnding", true, "Escape Ending", "SplitOn");
        settings.Add("GoodEnding", true, "Good Ending", "SplitOn");

    vars.ObjectivesMet = new List<string>();
    vars.LoadingScenes = new List<string>() { "Loading", "Entrance" };
}

init
{
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
    {
        var SaveProfile = mono["SaveProfile"];
        var LoadingSceneScript = mono["Bitwave_Scripts.LoadingSceneScript"];
        var TimeLoopScene = mono["TimeLoopScene"];

        vars.Helper["loopCount"] = SaveProfile.Make<int>("current", "loopCount");
        vars.Helper["shamansKilledEver"] = SaveProfile.Make<int>("current", "shamansKilledEver");
        vars.Helper["shamansConnected"] = SaveProfile.Make<int>("current", "shamansConnected");

        vars.Watchers = new MemoryWatcherList
        {
            new MemoryWatcher<bool>(new DeepPointer(LoadingSceneScript.Static + 0x9)) { Name = "loadingFromSave" },
            new MemoryWatcher<int>(new DeepPointer(TimeLoopScene.Static + 0x10, 0xac)) { Name = "sequenceIndex" }
        };

        return true;
    });


    vars.ObjectivesMet.Clear();
    current.PreviousScene = String.Empty;
    current.loadingFromSave = false;
    current.sequenceIndex = 0;
}

update
{
    current.Scene = vars.Helper.Scenes.Active.Name ?? current.Scene;
    if (current.Scene != old.Scene && !vars.LoadingScenes.Contains(old.Scene)) current.PreviousScene = old.Scene;

    vars.Watchers.UpdateAll(game);
    current.loadingFromSave = vars.Watchers["loadingFromSave"].Current ?? current.loadingFromSave;
    current.sequenceIndex = vars.Watchers["sequenceIndex"].Current ?? current.sequenceIndex;
}

isLoading
{
    if (!settings["LoadRemoval"]) return false;
    return vars.LoadingScenes.Contains(current.Scene);
}

start
{
    if (!old.loadingFromSave && current.loadingFromSave) return true;
}

onStart
{
    vars.ObjectivesMet.Clear();
    print("---STARTED---");
}


reset
{
    return old.Scene != current.Scene && current.Scene == "Title";
}

onReset
{
    print("---RESET---");
}


split
{
    // Test Modes
    if (settings["ArrivedScene"] && current.Scene != old.Scene && !vars.LoadingScenes.Contains(current.Scene)) return true;
    if (settings["LeftScene"] && current.Scene != old.Scene && !vars.LoadingScenes.Contains(old.Scene)) return true;

    if (settings["LoopCount"] && current.loopCount == old.loopCount + 1) 
    {
        print("New Loop");
        return true;
    }

    if (current.shamansKilledEver == old.shamansKilledEver + 1 && settings["ShamansKilled" + current.shamansKilledEver.ToString()])
    {
        print ("Shamans Killed: " + current.shamansKilledEver.ToString());
        return true;
    }

    if (current.shamansConnected == old.shamansConnected + 1 && settings["ShamansConnected" + current.shamansConnected.ToString()])
    {
        print ("Shamans Connected: " + current.shamansConnected.ToString());
        return true;
    }
    
    if (settings["EscapeEnding"] && old.Scene == "Escape Ending" && current.Scene != old.Scene)
    {
        print ("Escape Ending");
        return true;
    }

    if (settings["GoodEnding"] && current.Scene == "Good Ending" && old.sequenceIndex < 3 && current.sequenceIndex == 3)
    {
        print ("Good Ending");
        return true;
    }

    // Shamans killed by Location
    if (current.shamansKilledEver == old.shamansKilledEver + 1)
    {
        print("Shaman Killed in " + current.PreviousScene.ToString());
        if (settings["ShamanKilledGardnerGarden"] && current.PreviousScene == "GardnerGarden20") return true;
        if (settings["ShamanKilledGeggamojaRefinery"] && current.PreviousScene == "GeggamojaRefinery9") return true;
        if (settings["ShamanKilledInfinityLake"] && current.PreviousScene == "InfinityLake21") return true;
        if (settings["ShamanKilledPantheonOfTheStars"] && current.PreviousScene == "PantheonOfTheStars37") return true;
        if (settings["ShamanKilledRottenOrchard"] && current.PreviousScene == "RottenOrchard12") return true;
        if (settings["ShamanKilledQualiasQuarters"] && current.PreviousScene == "QualiasQuarters67") return true;
        if (settings["ShamanKilledVasasLegacy"] && current.PreviousScene == "VasasLegacy31") return true;
    }

    // Shamans connected by Location
    if (current.shamansConnected == old.shamansConnected + 1)
    {
        print("Shaman Connected in " + current.Scene.ToString());
        if (settings["ShamanConnectedGardnerGarden"] && current.Scene == "GardnerGarden20") return true;
        if (settings["ShamanConnectedGeggamojaRefinery"] && current.Scene == "GeggamojaRefinery9") return true;
        if (settings["ShamanConnectedInfinityLake"] && current.Scene == "InfinityLake21") return true;
        if (settings["ShamanConnectedPantheonOfTheStars"] && current.Scene == "PantheonOfTheStars37") return true;
        if (settings["ShamanConnectedRottenOrchard"] && current.Scene == "RottenOrchard12") return true;
        if (settings["ShamanConnectedQualiasQuarters"] && current.Scene == "QualiasQuarters67") return true;
        if (settings["ShamanConnectedVasasLegacy"] && current.Scene == "VasasLegacy31") return true;
    }

    // Area splits
    if (current.Scene != old.Scene && !vars.LoadingScenes.Contains(current.Scene))
    {
        bool doLocationSplit = false;
        if (current.Scene.Length >= 8 && current.Scene.Substring(0, 8) == "Entrance")
        {
            if (!vars.ObjectivesMet.Contains("ArrivedEntrance")) 
            {
                print("Arrived in Entrance");
                vars.ObjectivesMet.Add("ArrivedEntrance");
                if (settings["ArrivedEntrance"]) doLocationSplit = true;
            }
        }
        else
        {
            if (vars.ObjectivesMet.Contains("ArrivedEntrance") && !vars.ObjectivesMet.Contains("LeftEntrance")) 
            {
                print("Left Entrance");
                vars.ObjectivesMet.Add("LeftEntrance");
                if (settings["LeftEntrance"]) doLocationSplit = true;
            }
        }
        if (current.Scene.Length >= 14 && current.Scene.Substring(0, 14) == "LivingQuarters")
        {
            if (!vars.ObjectivesMet.Contains("ArrivedLivingQuarters")) 
            {
                print("Arrived in LivingQuarters");
                vars.ObjectivesMet.Add("ArrivedLivingQuarters");
                if (settings["ArrivedLivingQuarters"]) doLocationSplit = true;
            }
        }
        else
        {
            if (vars.ObjectivesMet.Contains("ArrivedLivingQuarters") && !vars.ObjectivesMet.Contains("LeftLivingQuarters")) 
            {
                print("Left LivingQuarters");
                vars.ObjectivesMet.Add("LeftLivingQuarters");
                if (settings["LeftLivingQuarters"]) doLocationSplit = true;
            }
        }
        if (current.Scene.Length >= 15 && current.Scene.Substring(0, 15) == "QualiasQuarters")
        {
            if (!vars.ObjectivesMet.Contains("ArrivedQualiasQuarters")) 
            {
                print("Arrived in QualiasQuarters");
                vars.ObjectivesMet.Add("ArrivedQualiasQuarters");
                if (settings["ArrivedQualiasQuarters"]) doLocationSplit = true;
            }
        }
        else
        {
            if (vars.ObjectivesMet.Contains("ArrivedQualiasQuarters") && !vars.ObjectivesMet.Contains("LeftQualiasQuarters")) 
            {
                print("Left QualiasQuarters");
                vars.ObjectivesMet.Add("LeftQualiasQuarters");
                if (settings["LeftQualiasQuarters"]) doLocationSplit = true;
            }
        }
        if (current.Scene.Length >= 13 && current.Scene.Substring(0, 13) == "GardnerGarden")
        {
            if (!vars.ObjectivesMet.Contains("ArrivedGardnerGarden")) 
            {
                print("Arrived in GardnerGarden");
                vars.ObjectivesMet.Add("ArrivedGardnerGarden");
                if (settings["ArrivedGardnerGarden"]) doLocationSplit = true;
            }
        }
        else
        {
            if (vars.ObjectivesMet.Contains("ArrivedGardnerGarden") && !vars.ObjectivesMet.Contains("LeftGardnerGarden")) 
            {
                print("Left GardnerGarden");
                vars.ObjectivesMet.Add("LeftGardnerGarden");
                if (settings["LeftGardnerGarden"]) doLocationSplit = true;
            }
        }
        if (current.Scene.Length >= 18 && current.Scene.Substring(0, 18) == "PantheonOfTheStars")
        {
            if (!vars.ObjectivesMet.Contains("ArrivedPantheonOfTheStars")) 
            {
                print("Arrived in PantheonOfTheStars");
                vars.ObjectivesMet.Add("ArrivedPantheonOfTheStars");
                if (settings["ArrivedPantheonOfTheStars"]) doLocationSplit = true;
            }
        }
        else
        {
            if (vars.ObjectivesMet.Contains("ArrivedPantheonOfTheStars") && !vars.ObjectivesMet.Contains("LeftPantheonOfTheStars")) 
            {
                print("Left PantheonOfTheStars");
                vars.ObjectivesMet.Add("LeftPantheonOfTheStars");
                if (settings["LeftPantheonOfTheStars"]) doLocationSplit = true;
            }
        }
        if (current.Scene.Length >= 17 && current.Scene.Substring(0, 17) == "GeggamojaRefinery")
        {
            if (!vars.ObjectivesMet.Contains("ArrivedGeggamojaRefinery")) 
            {
                print("Arrived in GeggamojaRefinery");
                vars.ObjectivesMet.Add("ArrivedGeggamojaRefinery");
                if (settings["ArrivedGeggamojaRefinery"]) doLocationSplit = true;
            }
        }
        else
        {
            if (vars.ObjectivesMet.Contains("ArrivedGeggamojaRefinery") && !vars.ObjectivesMet.Contains("LeftGeggamojaRefinery")) 
            {
                print("Left GeggamojaRefinery");
                vars.ObjectivesMet.Add("LeftGeggamojaRefinery");
                if (settings["LeftGeggamojaRefinery"]) doLocationSplit = true;
            }
        }
        if (current.Scene.Length >= 11 && current.Scene.Substring(0, 11) == "VasasLegacy")
        {
            if (!vars.ObjectivesMet.Contains("ArrivedVasasLegacy")) 
            {
                print("Arrived in VasasLegacy");
                vars.ObjectivesMet.Add("ArrivedVasasLegacy");
                if (settings["ArrivedVasasLegacy"]) doLocationSplit = true;
            }
        }
        else
        {
            if (vars.ObjectivesMet.Contains("ArrivedVasasLegacy") && !vars.ObjectivesMet.Contains("LeftVasasLegacy")) 
            {
                print("Left VasasLegacy");
                vars.ObjectivesMet.Add("LeftVasasLegacy");
                if (settings["LeftVasasLegacy"]) doLocationSplit = true;
            }
        }
        if (current.Scene.Length >= 13 && current.Scene.Substring(0, 13) == "RottenOrchard")
        {
            if (!vars.ObjectivesMet.Contains("ArrivedRottenOrchard")) 
            {
                print("Arrived in RottenOrchard");
                vars.ObjectivesMet.Add("ArrivedRottenOrchard");
                if (settings["ArrivedRottenOrchard"]) doLocationSplit = true;
            }
        }
        else
        {
            if (vars.ObjectivesMet.Contains("ArrivedRottenOrchard") && !vars.ObjectivesMet.Contains("LeftRottenOrchard")) 
            {
                print("Left RottenOrchard");
                vars.ObjectivesMet.Add("LeftRottenOrchard");
                if (settings["LeftRottenOrchard"]) doLocationSplit = true;
            }
        }
        if (current.Scene.Length >= 12 && current.Scene.Substring(0, 12) == "InfinityLake")
        {
            if (!vars.ObjectivesMet.Contains("ArrivedInfinityLake")) 
            {
                print("Arrived in InfinityLake");
                vars.ObjectivesMet.Add("ArrivedInfinityLake");
                if (settings["ArrivedInfinityLake"]) doLocationSplit = true;
            }
        }
        else
        {
            if (vars.ObjectivesMet.Contains("ArrivedInfinityLake") && !vars.ObjectivesMet.Contains("LeftInfinityLake")) 
            {
                print("Left InfinityLake");
                vars.ObjectivesMet.Add("LeftInfinityLake");
                if (settings["LeftInfinityLake"]) doLocationSplit = true;
            }
        }

        if (doLocationSplit) return true;
    }
}

onSplit
{
    print("--- SPLITTING ---");
}

exit
{
    vars.Helper.Dispose();
}

shutdown
{
    vars.Helper.Dispose();
}
