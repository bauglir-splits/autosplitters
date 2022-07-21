/*
    Autosplitter for What Lies in the Multiverse
    v1.2.0
    Developed against game version 1.1.1
    Now with timer data!
*/


state("What Lies in the Multiverse")
{
    int room_id: "What Lies in the Multiverse.exe", 0x2D3B650;
    double totalGameTime: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0x130, 0x490;
    double prologueTime: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD00;
    double chapter1Time: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD10;
    double chapter2Time: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD20;
    double chapter3Time: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD30;
    double chapter4Time: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD40;
    double chapter5Time: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD50;
    double chapter6Time: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD60;
    double chapter7Time: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD70;
    double chapter8Time: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD80;
    double chapter9Time: "What Lies in the Multiverse.exe", 0x2F7285C, 0x68, 0xD4, 0x0, 0xD90;
}

startup
{
    vars.Log = (Action<object>)(value => print(String.Concat("[What Lies in the Multiverse] ", value)));
    vars.chapterFirstRooms = new int[11] { 239, 247, 77, 57, 56, 204, 79, 74, 46, 19, 91 };


    settings.Add("BuiltInTimer", true, "Use game's built-in timer for IGT");
    settings.Add("Splits", true, "Split at the start of...");
    settings.Add("chapter0", true, "Prologue", "Splits");
    settings.Add("chapter1", true, "Chapter 1", "Splits");
    settings.Add("chapter2", true, "Chapter 2", "Splits");
    settings.Add("chapter3", true, "Chapter 3", "Splits");
    settings.Add("chapter4", true, "Chapter 4", "Splits");
    settings.Add("chapter5", true, "Chapter 5", "Splits");
    settings.Add("chapter6", true, "Chapter 6", "Splits");
    settings.Add("chapter7", true, "Chapter 7", "Splits");
    settings.Add("chapter8", true, "Chapter 8", "Splits");
    settings.Add("chapter9", true, "Final Chapter", "Splits");
    settings.Add("chapter10", true, "Credits", "Splits");

    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {
        var messageBox = MessageBox.Show(
            "The game is run in IGT (Time without Loads - Game Time).\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | What Lies in the Multiverse",
            MessageBoxButtons.YesNo, MessageBoxIcon.Question);
        
        if (messageBox == DialogResult.Yes) timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

init
{
    current.chapter = -1;
}

update
{
    for (var i = 0; i < vars.chapterFirstRooms.Length; i++)
    {
        if (current.chapter != i && current.room_id == vars.chapterFirstRooms[i]) current.chapter = i;
    }


    // Variables populated for optional use with the ASLVarViewer component
    vars.TotalGameTime = TimeSpan.FromSeconds(current.totalGameTime / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.PrologueTime = TimeSpan.FromSeconds(current.prologueTime / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.Chapter1Time = TimeSpan.FromSeconds(current.chapter1Time / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.Chapter2Time = TimeSpan.FromSeconds(current.chapter2Time / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.Chapter3Time = TimeSpan.FromSeconds(current.chapter3Time / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.Chapter4Time = TimeSpan.FromSeconds(current.chapter4Time / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.Chapter5Time = TimeSpan.FromSeconds(current.chapter5Time / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.Chapter6Time = TimeSpan.FromSeconds(current.chapter6Time / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.Chapter7Time = TimeSpan.FromSeconds(current.chapter7Time / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.Chapter8Time = TimeSpan.FromSeconds(current.chapter8Time / 60).ToString(@"hh\:mm\:ss\.ff");
    vars.Chapter9Time = TimeSpan.FromSeconds(current.chapter9Time / 60).ToString(@"hh\:mm\:ss\.ff");
}


start
{
    return old.room_id == 62 && current.room_id != 62;
}

onStart
{
    current.chapter = -1;
    vars.Log("Starting");
}

reset
{
    if (old.room_id == 28) return false;
    return old.room_id != 62 && current.room_id == 62;
}

onReset
{
    vars.Log("Resetting");
    current.chapter = -1;
}

isLoading
{
    if (settings["BuiltInTimer"]) return true;
    return (current.room_id == 62);
}

gameTime
{
    if (settings["BuiltInTimer"]) return TimeSpan.FromSeconds(current.totalGameTime / 60);
}

split
{
    if (current.chapter != old.chapter) 
    {
        vars.Log("Entering Chapter " + current.chapter.ToString());
        return settings["chapter" + current.chapter.ToString()];
    }
}