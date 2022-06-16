/*
    Autosplitter for What Lies in the Multiverse
    v1.0.2
    Developed against game version 1.0.23
*/


state("What Lies in the Multiverse")
{
    int room_id: "What Lies in the Multiverse.exe", 0x2C646F0;
}

startup
{
    vars.Log = (Action<object>)(value => print(String.Concat("[What Lies in the Multiverse] ", value)));
    vars.chapterFirstRooms = new int[11] { 237, 245, 77, 57, 56, 202, 79, 204, 46, 19, 91 };

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

start
{
    if (old.room_id == 62 && current.room_id != 62)
    {
        vars.Log("Starting");
        current.chapter = -1;
        return true;
    }
}

reset
{
    if (old.room_id == 28) return false;
    if (old.room_id != 62 && current.room_id == 62)
    {
        vars.Log("Resetting");
        current.chapter = -1;
        return true;
    }
}

isLoading
{
    return (current.room_id == 62);
}

update
{
    for (var i = 0; i < vars.chapterFirstRooms.Length; i++)
    {
        if (current.chapter != i && current.room_id == vars.chapterFirstRooms[i]) current.chapter = i;
    }
}

split
{
    if (current.chapter != old.chapter) 
    {
        vars.Log("Entering Chapter " + current.chapter.ToString());
        return settings["chapter" + current.chapter.ToString()];
    }
}
