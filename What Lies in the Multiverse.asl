/*
    Autosplitter for What Lies in the Multiverse
    v1.3.0
    Supports versions 1.0.23 - 1.1.2
*/

state("What Lies in the Multiverse") { }

state("What Lies in the Multiverse", "1.1.2")
{
    int room_id: "What Lies in the Multiverse.exe", 0x2D456A0;
    double totalGameTime: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0x130, 0x490;
    double prologueTime: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD00;
    double chapter1Time: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD10;
    double chapter2Time: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD20;
    double chapter3Time: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD30;
    double chapter4Time: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD40;
    double chapter5Time: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD50;
    double chapter6Time: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD60;
    double chapter7Time: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD70;
    double chapter8Time: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD80;
    double chapter9Time: "What Lies in the Multiverse.exe", 0x2F7C8AC, 0x68, 0xD4, 0x0, 0xD90;
}

state("What Lies in the Multiverse", "1.1.1")
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

state("What Lies in the Multiverse", "1.0.47")
{
    int room_id: "What Lies in the Multiverse.exe", 0x2D2C2E0;
    double totalGameTime: "What Lies in the Multiverse.exe", 0x2C7AE1C, 0x9A0;
    double prologueTime: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD00;
    double chapter1Time: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD10;
    double chapter2Time: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD20;
    double chapter3Time: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD30;
    double chapter4Time: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD40;
    double chapter5Time: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD50;
    double chapter6Time: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD60;
    double chapter7Time: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD70;
    double chapter8Time: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD80;
    double chapter9Time: "What Lies in the Multiverse.exe", 0x2F634EC, 0x68, 0xC8, 0x0, 0xD90;
}

state("What Lies in the Multiverse", "1.0.23")
{
    int room_id: "What Lies in the Multiverse.exe", 0x2C646F0;
}

startup
{
    vars.Log = (Action<object>)(value => print(String.Concat("[What Lies in the Multiverse] ", value)));

    settings.Add("BuiltInTimer", true, "Use game's built-in timer for IGT (v1.0.47+)");
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
    byte[] exeMD5HashBytes = new byte[0];
	using (var md5 = System.Security.Cryptography.MD5.Create())
    {
        using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
        {
            exeMD5HashBytes = md5.ComputeHash(s);
        }
    }

	var md5hash = exeMD5HashBytes.Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
    print("MD5: " + md5hash);

    switch(md5hash)
    {
        case "1FFC005CA71C11348DE241390A9E390D":
            version = "1.1.2";
            break;
        
        case "F7E6C5C93D2ED4A2CEE65B76F8DAFE0A":
            version = "1.1.1";
            break;

        case "3453B3FCFC38E40692C48BFE9DE5EE2B":
            version = "1.0.47";
            break;

        case "67DD43B40FE03B4BD636DB065106B0B6":
            version = "1.0.23";
            break;
    }

    switch(version)
    {
        case "1.1.2":
        case "1.1.1":
        case "1.0.47":
            vars.chapterFirstRooms = new int[11] { 239, 247, 77, 57, 56, 204, 79, 74, 46, 19, 91 };
            break;

        case "1.0.23":
            vars.chapterFirstRooms = new int[11] { 237, 245, 77, 57, 56, 202, 79, 204, 46, 19, 91 };
            break;
    }
}

update
{
    if (current.room_id != old.room_id) vars.Log("Room ID changed from " + old.room_id.ToString() + " to " + current.room_id.ToString());
    for (var i = 0; i < vars.chapterFirstRooms.Length; i++)
    {
        if (current.room_id == vars.chapterFirstRooms[i]) current.chapter = i;
    }


    if (version != "1.0.23")
    {
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
}


start
{
    return old.room_id == 62 && current.room_id != 62;
}

onStart
{
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
    if (version != "1.0.23" && settings["BuiltInTimer"]) return true;
    return (current.room_id == 62);
}

gameTime
{
    if (version != "1.0.23" && settings["BuiltInTimer"]) return TimeSpan.FromSeconds(current.totalGameTime / 60);
}

split
{
    if (current.chapter != old.chapter) 
    {
        vars.Log("Entering Chapter " + current.chapter.ToString());
        return settings["chapter" + current.chapter.ToString()];
    }
}