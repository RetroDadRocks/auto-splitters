state("Mesen", "0.0.1.0") {
    byte xPosGeneral		     : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0x63;
    byte yPosition	    	     : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0x67;
    byte selectableItems         : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0xF0;
    byte unselectableItems       : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0xF1;
    byte dynamicBattleAlert      : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0x10C;
    byte bossesMerit             : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0xF4;
    byte dynamicArea             : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0xF5;
    byte subArea                 : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0x2F;
    byte itemStatus              : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0x95;
    byte events                  : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0xF2;
    byte gaeaAwakes              : "MesenCore.dll", 0x42F99D0, 0xB8, 0x58, 0x40E;
    

}

// -------------------------------------------------------------------------------------------------------------------------------
state("fceux", "2.2.3")
{
    byte xPosGeneral		     : 0x003B1388, 0x63;
    byte yPosition	    	     : 0x003B1388, 0x67;
    byte selectableItems         : 0x003B1388, 0xF0;
    byte unselectableItems       : 0x003B1388, 0xF1;
    byte dynamicBattleAlert      : 0x003B1388, 0x10C;
    byte bossesMerit             : 0x003B1388, 0xF4;
    byte dynamicArea             : 0x003B1388, 0xF5;
    byte subArea                 : 0x003B1388, 0x2F;
    byte itemStatus              : 0x003B1388, 0x95;
    byte events                  : 0x003B1388, 0xF2;
    byte gaeaAwakes              : 0x003B1388, 0x40E;
}

// --------------------------------------------------------------------------------------------------------------------------------

startup
{
    //Selectable splits'
    settings.Add("location1", true, "Arcadia | Argolis");
    settings.Add("meetZeus", true, "Meet with Zeus to unlock the Gods", "location1");
    settings.Add("hermesTemple1", true, "Hermes Temple", "location1");
    settings.Add("sandals", true, "Sandals of Hermes", "location1");

    settings.Add("location2", true, "Peloponnesus Forest");
    settings.Add("beginHydra", false, "Begin Hydra battle", "location2");
    settings.Add("defeatedHydra", false, "Hydra has been defeated", "location2");
    settings.Add("sword", true, "Sword of the Peloponnesus Nymph", "location2");
    settings.Add("harp", true, "Harp of Apollo","location2");
    settings.Add("beginCyclops", false, "Begin Cyclops battle", "location2");
    settings.Add("defeatedCyclops", true, "Cyclops defeated", "location2");

    settings.Add("location3", true, "Laconia");
    settings.Add("ocarina", true, "Ocarina of Poseidon","location3");
    settings.Add("pitcher", false, "Trojan Pitcher","location3");
    settings.Add("beginSiren", false, "Begin Siren battle","location3");
    settings.Add("defeatedSiren", true, "Siren defeated","location3");
    settings.Add("eye", true, "The Eye of the Graeae Sisters","location3");

    settings.Add("location4", true, "Back to Argolis");
    settings.Add("frag1", true, "Heart Fragment - Argolis","location4");

    settings.Add("location5", true, "Attica");
    settings.Add("key", false, "Door Key for the Heart Fragment in Phthia","location5");
    settings.Add("beginGaea", false, "Begin Gaea battle","location5");
    settings.Add("defeatedGaea", true, "Gaea has been defeated","location5");

    settings.Add("location6", true, "Phthia");
    settings.Add("divineSword", true, "Divine Sword of Hephaestos","location6");
    settings.Add("frag2", true, "Heart Fragment - Phthia","location6");

    settings.Add("location7", true, "Crete");
    settings.Add("bracelet", true, "Bracelet of Power","location7");
    settings.Add("beginMinotaur", false, "Begin Minotaur Battle","location7");
    settings.Add("frag3", true, "Heart Fragment - Crete","location7");

    settings.Add("location8", true, "Tartarus");
    settings.Add("enterTartarus", true, "Enter Tartarus","location8");
    settings.Add("tartarusForest", true, "Tartarus Forest","location8");
    settings.Add("hadesPalace", true, "Enter Hades Palace","location8");
    settings.Add("hadesBattle", true, "Begin Hades Battle","location8");

    settings.Add("credits", true, "The Battle of Olympus AutoSplitter v0.1 by RetroDad");
	settings.Add("support", true, "Supported emulators : mesen RTA 0.0.7 | fceux 2.2.3", "credits");

    // ------------------------------------------------------------------------------------------------------------

}

init {
    // Items that can be selected
    vars.sword = 4;
    vars.harp = 16;
    vars.ocarina = 32;
    vars.pitcher = 64;
    vars.eye = 128;
    vars.divineSword = 8;

    // Items that cannot be selected
    vars.sandals = 2;
    vars.frag1 = 64;
    vars.absDifference = 5;
    vars.key = 32;
    vars.frag2 = 128;
    vars.bracelet = 16;
    vars.frag3 = false;

    // events
    vars.meetZeus = 4;

    // Boss values
    vars.hydra = 4;
    vars.hydraStarted = false;
    vars.cyclops = 8;
    vars.cyclopsStarted = false;
    vars.siren = 32;
    vars.sirenStarted = false;
    vars.gaea = 16;
    vars.gaeaStarted = false;
    vars.minotaurStarted = false;
    vars.hades = 64;
    vars.hadesDefeated = false;

    // Areas
    vars.area = 0;
    vars.arcadia = 0; 
    vars.attica = 1;
    vars.argolis = 2;
    vars.peloponnesus = 3;
    vars.laconia = 4; 
    vars.pythia = 5;
    vars.crete = 6;
    vars.phrygia = 7;
    vars.tartarusIntro = 8;
    vars.tartarusStructures = 9;
    vars.tartarusFreshAir = 10;
    vars.tartarusPalace = 11;
    vars.tartarusEntered = false;
    vars.tartarusForest = false;
    vars.hadesPalaceEntered = false;
    vars.hadesBattleStarted = false;
    vars.heleneRescued = false;

    // Other
    vars.hermesTemple1Entered = false;
    vars.battleCall = 9;
    vars.battleAlert = 0;
    vars.itemInUse = 204;
    vars.xReadyBattle = false;
    vars.testing = false;

}

start {
    vars.hermesTemple1Entered = false;
    vars.hydraStarted = false;
    vars.cyclopsStarted = false;
    vars.sirenStarted = false;
    vars.gaeaStarted = false;
    vars.minotaurStarted = false;
    vars.frag3 = false;
    vars.tartarusEntered = false;
    vars.tartarusForest = false;
    vars.hadesPalaceEntered = false;
    vars.hadesBattleStarted = false;
    vars.hadesDefeated = false;
    vars.heleneRescued = false;

    // Use X value to start the run.
    if(old.xPosGeneral < 49 && current.xPosGeneral >= 49){
        return true;
    }
}

split {

    if(current.dynamicArea <= 11){
        vars.area = current.dynamicArea;
    }

    // Zeus, first visit
    if(settings["meetZeus"]){
        vars.absDifference = Math.Abs(current.events - old.events);
        if(vars.absDifference == vars.meetZeus){
            return true;
        }
    }

    // Hermes Temple
    if(settings["hermesTemple1"]){
        if(vars.area == 2 && current.subArea == 7 && current.dynamicArea == 14 && old.dynamicArea == 2 && current.unselectableItems == 0 && !vars.hermesTemple1Entered){
            vars.hermesTemple1Entered = true;
            return true;
        }
    }
   
    // Sandals of Hermes
    if(settings["sandals"]){
        vars.absDifference = Math.Abs(current.unselectableItems - old.unselectableItems);
        if(vars.absDifference == vars.sandals){
            return true;
        }
    }

    //**** Hydra Battle ****
    if(settings["beginHydra"]){
        if(vars.area == vars.peloponnesus && current.subArea == 6 && !vars.hydraStarted && current.dynamicBattleAlert == vars.battleCall && old.dynamicBattleAlert != vars.battleCall){
            vars.hydraStarted = true;
            return true;
        }
    }

    if(settings["defeatedHydra"]){
        vars.absDifference = Math.Abs(current.bossesMerit - old.bossesMerit);
        if(vars.absDifference == vars.hydra){
            return true;
        }
    }

    // ********************

    // Sword of the Peloponnesus forest
    if(settings["sword"]){
        vars.absDifference = Math.Abs(current.selectableItems - old.selectableItems);
        if(vars.absDifference == vars.sword){
            return true;
        }
    }

    // Harp of Apollo
    if(settings["harp"]){
        vars.absDifference = Math.Abs(current.selectableItems - old.selectableItems);
        if(vars.absDifference == vars.harp){
            return true;
        }
    }

    // **** Cyclops Battle ****
    if(settings["beginCyclops"]){
        if(vars.area == vars.peloponnesus && current.subArea == 4 && current.dynamicBattleAlert == vars.battleCall && old.dynamicBattleAlert != vars.battleCall && !vars.cyclopsStarted){
            vars.cyclopsStarted = true;
            return true;
        }
    }

    if(settings["defeatedCyclops"]){
        vars.absDifference = Math.Abs(current.bossesMerit - old.bossesMerit);
        if(vars.absDifference == vars.cyclops){
            return true;
        }
    }

    // **********************

    // Ocarina of Poseidon
    if(settings["ocarina"]){
        vars.absDifference = Math.Abs(current.selectableItems - old.selectableItems);
        if(vars.absDifference == vars.ocarina){
            return true;
        }
    }

    // Trojan Pitcher
    if(settings["pitcher"]){
        vars.absDifference = Math.Abs(current.selectableItems - old.selectableItems);
        if(vars.absDifference == vars.pitcher){
            return true;
        }
    }

    // **** Siren Battle ****
    if(settings["beginSiren"]){
        if(vars.area == vars.laconia && current.subArea == 3 && current.xPosGeneral < 20 && !vars.sirenStarted){
            vars.xReadyBattle = true;
        }

        if(vars.area == vars.laconia && current.subArea == 3 && current.xPosGeneral >= 58 && current.xPosGeneral < 74 && vars.xReadyBattle && !vars.sirenStarted){
            vars.sirenStarted = true;
            vars.xReadyBattle = false;
            return true;
        }
    }

    if(settings["defeatedSiren"]){
        vars.absDifference = Math.Abs(current.bossesMerit - old.bossesMerit);
        if(vars.absDifference == vars.siren){
            return true;
        }
    }

    // **********************

    // The Eye of the Graeae Sisters
    if(settings["eye"]){
        vars.absDifference = Math.Abs(current.selectableItems - old.selectableItems);
        if(vars.absDifference == vars.eye){
            return true;
        }
    }

    // **********************
    
    // The First Fragment of Love
    if(settings["frag1"]){
        vars.absDifference = Math.Abs(current.unselectableItems - old.unselectableItems);
        if(vars.absDifference == vars.frag1){
            return true;
        }
    }

    // Door Key for the 2nd Fragment of Love
    if(settings["key"]){
        vars.absDifference = Math.Abs(current.unselectableItems - old.unselectableItems);
        if(vars.absDifference == vars.key){
            return true;
        }
    }

    // **** Gaea **** 
    if(settings["beginGaea"]){
        if(vars.area == vars.attica && current.subArea == 3 && current.gaeaAwakes > 0 && !vars.gaeaStarted){
            vars.gaeaStarted = true;
            return true;
        }
    }

    if(settings["defeatedGaea"]){
        vars.absDifference = Math.Abs(current.bossesMerit - old.bossesMerit);
        if(vars.absDifference == vars.gaea){
            return true;
        }
    }

    // **********************


    // Divine Sword of Hephaestos
    if(settings["divineSword"]){
        vars.absDifference = Math.Abs(current.selectableItems - old.selectableItems);
        if(vars.absDifference == vars.divineSword){
            return true;
        }
    }

    // Heart Fragment - Phthia
    if(settings["frag2"]){
        vars.absDifference = Math.Abs(current.unselectableItems - old.unselectableItems);
        if(vars.absDifference == vars.frag2){
            return true;
        }
    }

    // Bracelet of Power
    if(settings["bracelet"]){
        vars.absDifference = Math.Abs(current.unselectableItems - old.unselectableItems);
        if(vars.absDifference == vars.bracelet){
            return true;
        }
    }

    // **** Minotaur ****
    if(settings["beginMinotaur"]){
        if(vars.area == vars.crete && current.subArea == 17 && current.dynamicBattleAlert == vars.battleCall && old.dynamicBattleAlert != vars.battleCall && !vars.minotaurStarted){
            vars.minotaurStarted = true;
            return true;
        }
    }

    // Heart Fragment - Crete
    if(settings["frag3"]){
        if(vars.area == vars.crete && current.dynamicArea == 13 && current.subArea == 17 && current.itemStatus == 136 && !vars.frag3){
            vars.frag3 = true;
            return true;
        }
    }

    // Enter Tartarus
    if(settings["enterTartarus"]){
        if(vars.area == vars.tartarusIntro && current.subArea == 0 && !vars.tartarusEntered){
            vars.tartarusEntered = true;
            return true;
        }
    }

    // Enter Tartarus Forest 
    if(settings["tartarusForest"]){
        if(vars.area == vars.tartarusIntro && current.subArea == 9 && old.subArea == 7 && !vars.tartarusForest){
            vars.tartarusForest = true;
            return true;
        }
    }

    // Enter Hades' Palace 
    if(settings["hadesPalace"]){
        if(vars.area == vars.tartarusPalace && current.subArea == 2 && !vars.hadesPalaceEntered){
            vars.hadesPalaceEntered = true;
            return true;
        }
    }

    // Enter Hades' Battle
    if(settings["hadesBattle"]){
        if(vars.area == vars.tartarusPalace && current.subArea == 6 && old.subArea == 5 && !vars.hadesBattleStarted){
            vars.hadesBattleStarted = true;
            return true;
        }
    }

    // Helene Rescued 
        if(vars.area == vars.tartarusPalace && current.subArea == 5 && !vars.heleneRescued && current.dynamicArea == 22 ){
            vars.heleneRescued = true;
            return true;
        }

}

// optional, not using
reset {

}

update {
    return true;
}