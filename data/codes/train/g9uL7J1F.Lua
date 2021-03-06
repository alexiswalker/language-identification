-- megamenulib.lua
-- library script

menu = "main"

ButtonLeft = "NavDwn"
ButtonRight = "NavUp"
ButtonDown = "NavInvalid"
ButtonUp = "Erand"

crest = "~BULLY_CREST~"

mainmenu = {
  "Model Swapper",
  "Style Changer",
  "Ped Spawner",
  "Save Game",
  "Vehicle Options",
  "Clock Options",
  "Health Adjuster",
  "Weapons",
  "Display Coordinates",
  "Display Controls",
  "Music Player",
  "Speech",
  "Flags",
  "Recruit Target Ped",
  "Teleporter",
  "Clear All Peds In Area",
  "Camera Options",
}
mmi = 1

Peds = {
  {model = "player",style = "/Global/Player",styleFile = "Act/Player.act",name = "Jimmy"},
  {model = "DOgirl_Zoe_EG",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Zoe"},
  {model = "NDGirl_Beatrice",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Beatrice"},
  {model = "NDH1a_Algernon",style = "/Global/N_Striker_B",styleFile = "Act/Anim/N_Striker_B.act",name = "Algernon"},
  {model = "NDH1_Fatty",style = "/Global/N_Striker_A",styleFile = "Act/Anim/N_Striker_A.act",name = "Fatty"},
  {model = "ND2nd_Melvin",style = "/Global/N_Striker_A",styleFile = "Act/Anim/N_Striker_A.act",name = "Melvin"},
  {model = "NDH2_Thad",style = "/Global/N_Ranged_A",styleFile = "Act/Anim/N_Ranged_A.act",name = "Thad"},
  {model = "NDH3_Bucky",style = "/Global/N_Ranged_A",styleFile = "Act/Anim/N_Ranged_A.act",name = "Bucky"},
  {model = "NDH2a_Cornelius",style = "/Global/N_Ranged_A",styleFile = "Act/Anim/N_Ranged_A.act",name = "Cornelius"},
  {model = "NDLead_Earnest",style = "/Global/N_Ranged_A",styleFile = "Act/Anim/N_Ranged_A.act",name = "Earnest"},
  {model = "NDH3a_Donald",style = "/Global/N_Ranged_A",styleFile = "Act/Anim/N_Ranged_A.act",name = "Donald"},
  {model = "JKH1_Damon",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Damon"},
  {model = "JKH1a_Kirby",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Kirby"},
  {model = "JKGirl_Mandy",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Mandy"},
  {model = "JKH2_Dan",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Dan"},
  {model = "JKH2a_Luis",style = "/Global/J_Grappler_A",styleFile = "Act/Anim/J_Grappler_A.act",name = "Luis"},
  {model = "JKH3_Casey",style = "/Global/J_Melee_A",styleFile = "Act/Anim/J_Melee_A.act",name = "Casey"},
  {model = "JKH3a_Bo",style = "/Global/J_Melee_A",styleFile = "Act/Anim/J_Melee_A.act",name = "Bo"},
  {model = "JKlead_Ted",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Ted"},
  {model = "JK2nd_Juri",style = "/Global/J_Grappler_A",styleFile = "Act/Anim/J_Grappler_A.act",name = "Juri"},
  {model = "GR2nd_Peanut",style = "/Global/G_Striker_A",styleFile = "Act/Anim/G_Striker_A.act",name = "Peanut"},
  {model = "GRH2A_Hal",style = "/Global/G_Grappler_A",styleFile = "Act/Anim/G_Grappler_A.act",name = "Hal"},
  {model = "GRlead_Johnny",style = "/Global/G_Striker_A",styleFile = "Act/Anim/G_Striker_A.act",name = "Johnny"},
  {model = "GRH1_Lefty",style = "/Global/G_Melee_A",styleFile = "Act/Anim/G_Melee_A.act",name = "Lefty"},
  {model = "GRGirl_Lola",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Lola"},
  {model = "GRH3_Lucky",style = "/Global/G_Striker_A",styleFile = "Act/Anim/G_Striker_A.act",name = "Lucky"},
  {model = "GRH1a_Vance",style = "/Global/G_Melee_A",styleFile = "Act/Anim/G_Melee_A.act",name = "Vance"},
  {model = "GRH3a_Ricky",style = "/Global/G_Striker_A",styleFile = "Act/Anim/G_Striker_A.act",name = "Ricky"},
  {model = "GRH2_Norton",style = "/Global/G_Grappler_A",styleFile = "Act/Anim/G_Grappler_A.act",name = "Norton"},
  {model = "PRH1_Gord",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Gord"},
  {model = "PRH1a_Tad",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Tad"},
  {model = "PRH2a_Chad",style = "/Global/P_Grappler_A",styleFile = "Act/Anim/P_Grappler_A.act",name = "Chad"},
  {model = "PR2nd_Bif",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Bif"},
  {model = "PRH3_Justin",style = "/Global/P_Striker_B",styleFile = "Act/Anim/P_Striker_B.act",name = "Justin"},
  {model = "PRH2_Bryce",style = "/Global/P_Grappler_A",styleFile = "Act/Anim/P_Grappler_A.act",name = "Bryce"},
  {model = "PRH2_Bryce_OBOX",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Bryce"},
  {model = "PRlead_Darby",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Darby"},
  {model = "PRGirl_Pinky",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Pinky"},
  {model = "GN_Asiangirl",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Angie"},
  {model = "PRH3a_Parker",style = "/Global/P_Striker_B",styleFile = "Act/Anim/P_Striker_B.act",name = "Parker"},
  {model = "DOH2_Jerry",style = "/Global/DO_Grappler_A",styleFile = "Act/Anim/DO_Grappler_A.act",name = "Jerry"},
  {model = "DOH1a_Otto",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Otto"},
  {model = "DOH2a_Leon",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Leon"},
  {model = "DOH1_Duncan",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Duncan"},
  {model = "DOH3_Henry",style = "/Global/DO_Grappler_A",styleFile = "Act/Anim/DO_Grappler_A.act",name = "Henry"},
  {model = "DOH3a_Gurney",style = "/Global/DO_Grappler_A",styleFile = "Act/Anim/DO_Grappler_A.act",name = "Gurney"},
  {model = "DO2nd_Omar",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Omar"},
  {model = "DOGirl_Zoe",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Zoe"},
  {model = "PF2nd_Max",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "Max"},
  {model = "PFH1_Seth",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "Seth"},
  {model = "PFH2_Edward",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "Edward"},
  {model = "PFlead_Karl",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "Karl"},
  {model = "TO_Orderly",style = "/Global/LE_Orderly_A",styleFile = "Act/Anim/LE_Orderly_A.act",name = "Theo"},
  {model = "TE_HallMonitor",style = "/Global/TE_Female_A",styleFile = "Act/Anim/TE_Female_A.act",name = "MissPeabody"},
  {model = "TE_GymTeacher",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "MrBurton"},
  {model = "TE_Janitor",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrLuntz"},
  {model = "TE_English",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "MrGalloway"},
  {model = "TE_Cafeteria",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "Edna"},
  {model = "TE_Secretary",style = "/Global/TE_Female_A",styleFile = "Act/Anim/TE_Female_A",name = "MissWinston"},
  {model = "TE_Nurse",style = "/Global/TE_Female_A",styleFile = "Act/Anim/TE_Female_A",name = "MrsMcRae"},
  {model = "TE_MathTeacher",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "MrHuntingdon"},
  {model = "TE_Librarian",style = "/Global/TE_Female_A",styleFile = "Act/Anim/TE_Female_A.act",name = "MrsCarvin"},
  {model = "TE_Art",style = "/Global/TE_Female_A",styleFile = "Act/Anim/TE_Female_A.act",name = "MsPhillips"},
  {model = "TE_Biology",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "MrSlawter"},
  {model = "TE_Principal",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "DrCrabblesnitch"},
  {model = "GN_Littleblkboy",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Sheldon"},
  {model = "GN_SexyGirl",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Christy"},
  {model = "GN_Littleblkgirl",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Gloria"},
  {model = "GN_Hispanicboy",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Pedro"},
  {model = "GN_Greekboy",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Constantinos"},
  {model = "GN_Fatboy",style = "/Global/GS_Fat_A",styleFile = "Act/Anim/GS_Fat_A.act",name = "Ray"},
  {model = "GN_Boy01",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Ivan"},
  {model = "GN_Boy02",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Trevor"},
  {model = "GN_Fatgirl",style = "/Global/GS_Fat_A",styleFile = "Act/Anim/GS_Fat_A.act",name = "Eunice"},
  {model = "DOlead_Russell",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Russell"},
  {model = "TO_Business1",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "DrBambillo"},
  {model = "TO_Business2",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrSullivan"},
  {model = "TO_BusinessW1",style = "/Global/CV_Female_A",styleFile = "Act/Anim/CV_Female_A.act",name = "MsKopke"},
  {model = "TO_BusinessW2",style = "/Global/CV_Female_A",styleFile = "Act/Anim/CV_Female_A.act",name = "MsRushinski"},
  {model = "TO_RichW1",style = "/Global/CV_Female_A",styleFile = "Act/Anim/CV_Female_A.act",name = "MsIsaacs"},
  {model = "TO_RichW2",style = "/Global/CV_Female_A",styleFile = "Act/Anim/CV_Female_A.act",name = "BethanyJones"},
  {model = "TO_Fireman",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "ORourke"},
  {model = "TO_Cop",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "OfficerMonson"},
  {model = "TO_Comic",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "ZackOwens"},
  {model = "GN_Bully03",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Trent"},
  {model = "TO_Bikeowner",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "TobiasMason"},
  {model = "TO_Hobo",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrGrant"},
  {model = "Player_Mascot",style = "/Global/J_Mascot",styleFile = "Act/Anim/J_Mascot.act",name = "Mascot"},
  {model = "TO_GroceryOwner",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrOh"},
  {model = "GN_Sexygirl_UW",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Christy"},
  {model = "DOLead_Edgar",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Edgar"},
  {model = "JK_LuisWrestle",style = "/Global/J_Grappler_A",styleFile = "Act/Anim/J_Grappler_A.act",name = "Luis"},
  {model = "JKGirl_MandyUW",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Mandy"},
  {model = "PRGirl_PinkyUW",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Pinky"},
  {model = "NDGirl_BeatriceUW",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Beatrice"},
  {model = "GRGirl_LolaUW",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Lola"},
  {model = "TO_Cop2",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "OfficerWilliams"},
  {model = "Player_OWres",style = "/Global/Player",styleFile = "Act/Player.act",name = "Jimmy"},
  {model = "GN_Bully02",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Davis"},
  {model = "TO_RichM1",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrBreckindale"},
  {model = "TO_RichM2",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrDoolin"},
  {model = "GN_Bully01",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Troy"},
  {model = "TO_FireOwner",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Nate"},
  {model = "TO_CSOwner_2",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrCarmichael"},
  {model = "TO_CSOwner_3",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "NickyCharles"},
  {model = "TE_Chemistry",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "MrWatts"},
  {model = "TO_Poorwoman",style = "/Global/CV_OLD",styleFile = "Act/Anim/CV_OLD.act",name = "MissAbby"},
  {model = "TO_MotelOwner",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Mihailovich"},
  {model = "JKKirby_FB",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Kirby"},
  {model = "JKTed_FB",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Ted"},
  {model = "JKDan_FB",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Dan"},
  {model = "JKDamon_FB",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Damon"},
  {model = "TO_Carny02",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Freeley"},
  {model = "TO_Carny01",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Dorsey"},
  {model = "TO_CarnyMidget",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Hector"},
  {model = "TO_Poorman2",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Osbourne"},
  {model = "PRH2A_Chad_OBOX",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Chad"},
  {model = "PRH3_Justin_OBOX",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Justin"},
  {model = "PRH3a_Parker_OBOX",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Parker"},
  {model = "TO_BarberRich",style = "/Global/CV_Female_A",styleFile = "Act/Anim/CV_Female_A.act",name = "MariaTheresa"},
  {model = "GenericWrestler",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Bob"},
  {model = "ND_FattyWrestle",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Fatty"},
  {model = "TO_Industrial",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Chuck"},
  {model = "TO_Associate",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Ian"},
  {model = "TO_Asylumpatient",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Fenwick"},
  {model = "TE_Autoshop",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "Neil"},
  {model = "TO_Mailman",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrSvenson"},
  {model = "TO_Tattooist",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Denny"},
  {model = "TE_Assylum",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "MrGalloway"},
  {model = "Nemesis_Gary",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Gary"},
  {model = "TO_Oldman2",style = "/Global/CV_OLD",styleFile = "Act/Anim/CV_OLD.act",name = "Krakauer"},
  {model = "TO_BarberPoor",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrMoratti"},
  {model = "PR2nd_Bif_OBOX",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Bif"},
  {model = "Peter",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Peter"},
  {model = "TO_RichM3",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrSmith"},
  --{model = "Rat_Ped",style = "/Global/AN_Rat",styleFile = "Act/Anim/AN_RAT.act"name = ,"Rat (disabled)"},)
  {model = "GN_LittleGirl_2",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Melody"},
  {model = "GN_LittleGirl_3",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Karen"},
  {model = "GN_WhiteBoy",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Gordon"},
  {model = "TO_FMidget",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Brandy"},
  {model = "Dog_Pitbull",style = "/Global/AN_DOG",styleFile = "Act/Anim/AN_DOG.act",name = "Pitbull"},
  {model = "GN_SkinnyBboy",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Lance"},
  {model = "TO_Carnie_female",style = "/Global/CV_Female_A",styleFile = "Act/Anim/CV_Female_A.act",name = "Crystal"},
  {model = "TO_Business3",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrMartin"},
  {model = "GN_Bully04",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Ethan"},
  {model = "GN_Bully05",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Wade"},
  {model = "GN_Bully06",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Tom"},
  {model = "TO_Business4",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrRamirez"},
  {model = "TO_Business5",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "MrHuntingdon"},
  {model = "DO_Otto_asylum",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Otto"},
  {model = "TE_History",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "MrWiggins"},
  {model = "TO_Record",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Floyd"},
  {model = "DO_Leon_Assylum",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Leon"},
  {model = "DO_Henry_Assylum",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Henry"},
  {model = "NDH1_FattyChocolate",style = "/Global/N_Striker_A",styleFile = "Act/Anim/N_Striker_A.act",name = "Fatty"},
  {model = "TO_GroceryClerk",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Stan"},
  {model = "TO_Handy",style = "/Global/CV_OLD",styleFile = "Act/Anim/CV_OLD.act",name = "Handy"},
  {model = "TO_Orderly2",style = "/Global/LE_Orderly_A",styleFile = "Act/Anim/LE_Orderly_A.act",name = "Gregory"},
  {model = "GN_Hboy_Ween",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Pedro"},
  {model = "Nemesis_Ween",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Gary"},
  {model = "GRH3_Lucky_Ween",style = "/Global/G_Striker_A",styleFile = "Act/Anim/G_Striker_A.act",name = "Lucky"},
  {model = "NDH3a_Donald_ween",style = "/Global/N_Ranged_A",styleFile = "Act/ANim/N_Ranged_A.act",name = "Donald"},
  {model = "PRH3a_Parker_Ween",style = "/Global/P_Striker_B",styleFile = "Act/Anim/P_Striker_B.act",name = "Parker"},
  {model = "JKH3_Casey_Ween",style = "/Global/J_Melee_A",styleFile = "Act/Anim/J_Melee_A.act",name = "Casey"},
  {model = "Peter_Ween",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Peter"},
  {model = "GN_AsianGirl_Ween",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Angie"},
  {model = "PRGirl_Pinky_Ween",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Pinky"},
  {model = "JKH1_Damon_ween",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Damon"},
  {model = "GN_WhiteBoy_Ween",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Gordon"},
  {model = "GN_Bully01_Ween",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Ivan"},
  {model = "GN_Boy02_Ween",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Trevor"},
  {model = "PR2nd_Bif_OBOX_D1",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Bif"},
  {model = "GRH1a_Vance_Ween",style = "/Global/G_Melee_A",styleFile = "Act/Anim/G_Melee_A.act",name = "Vance"},
  {model = "NDH2_Thad_Ween",style = "/Global/N_Ranged_A",styleFile = "Act/Anim/N_Ranged_A.act",name = "Thad"},
  {model = "PRGirl_Pinky_BW",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Pinky"},
  {model = "DOlead_Russell_BU",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "Russell"},
  {model = "PRH1a_Tad_BW",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Tad"},
  {model = "PRH2_Bryce_BW",style = "/Global/P_Grappler_A",styleFile = "Act/Anim/P_Grappler_A.act",name = "Bryce"},
  {model = "PRH3_Justin_BW",style = "/Global/P_Striker_B",styleFile = "Act/Anim/P_Striker_B.act",name = "Justin"},
  {model = "GN_Asiangirl_CH",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Angie"},
  {model = "GN_Sexygirl_CH",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Christy"},
  {model = "PRGirl_Pinky_CH",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Pinky"},
  {model = "TO_NH_Res_01",style = "/Global/CV_OLD",styleFile = "Act/Anim/CV_OLD.act",name = "MrBuba"},
  {model = "TO_NH_Res_02",style = "/Global/CV_OLD",styleFile = "Act/Anim/CV_OLD.act",name = "MrGordon"},
  {model = "TO_NH_Res_03",style = "/Global/CV_OLD",styleFile = "Act/Anim/CV_OLD.act",name = "MrsLisburn"},
  {model = "NDH1_Fatty_DM",style = "/Global/N_Striker_A",styleFile = "Act/Anim/N_Striker_A.act",name = "Fatty"},
  {model = "TO_PunkBarber",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Betty"},
  {model = "FightingMidget_01",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Lightning"},
  {model = "FightingMidget_02",style = "/Global/G_Striker_A",styleFile = "Act/Anim/G_Striker_A.act",name = "Zeke"},
  {model = "TO_Skeletonman",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Alfred"},
  {model = "TO_Beardedwoman",style = "/Global/CV_Female_A",styleFile = "Act/Anim/CV_Female_A.act",name = "Paris"},
  {model = "TO_CarnieMermaid",style = "/Global/CV_Female_A",styleFile = "Act/Anim/CV_Female_A.act",name = "Courtney"},
  {model = "TO_Siamesetwin2",style = "/Global/CV_Female_A",styleFile = "Act/Anim/CV_Female_A.act",name = "Delilah"},
  {model = "TO_Paintedman",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Drew"},
  {model = "TO_GN_Workman",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Castillo"},
  {model = "DOLead_Edgar_GS",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Edgar"},
  {model = "DOH3a_Gurney_GS",style = "/Global/DO_Grappler_A",styleFile = "Act/Anim/DO_Grappler_A.act",name = "Gurney"},
  {model = "DOH2_Jerry_GS",style = "/Global/DO_Grappler_A",styleFile = "Act/Anim/DO_Grappler_A.act",name = "Jerry"},
  {model = "DOH2a_Leon_GS",style = "/Global/DO_Striker_A",styleFile = "Act/Anim/DO_Striker_A.act",name = "Leon"},
  {model = "GRH2a_Hal_GS",style = "/Global/G_Grappler_A",styleFile = "Act/Anim/G_Grappler_A.act",name = "Hal"},
  {model = "GRH2_Norton_GS",style = "/Global/G_Grappler_A",styleFile = "Act/Anim/G_Grappler_A.act",name = "Norton"},
  {model = "GR2nd_Peanut_GS",style = "/Global/G_Striker_A",styleFile = "Act/Anim/G_Striker_A.act",name = "Peanut"},
  {model = "GRH1a_Vance_GS",style = "/Global/G_Melee_A",styleFile = "Act/Anim/G_Melee_A.act",name = "Vance"},
  {model = "JKH3a_Bo_GS",style = "/Global/J_Melee_A",styleFile = "Act/Anim/J_Melee_A.act",name = "Bo"},
  {model = "JKH1_Damon_GS",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Damon"},
  {model = "JK2nd_Juri_GS",style = "/Global/J_Grappler_A",styleFile = "Act/Anim/J_Grappler_A.act",name = "Juri"},
  {model = "JKH1a_Kirby_GS",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Kirby"},
  {model = "NDH1a_Algernon_GS",style = "/Global/N_Striker_B",styleFile = "Act/Anim/N_Striker_B.act",name = "Algernon"},
  {model = "NDH3_Bucky_GS",style = "/Global/N_Ranged_A",styleFile = "Act/ANim/N_Ranged_A.act",name = "Bucky"},
  {model = "NDH2_Thad_GS",style = "/Global/N_Ranged_A",styleFile = "Act/Anim/N_Ranged_A.act",name = "Thad"},
  {model = "PRH3a_Parker_GS",style = "/Global/P_Striker_B",styleFile = "Act/Anim/P_Striker_B.act",name = "Parker"},
  {model = "PRH3_Justin_GS",style = "/Global/P_Striker_B",styleFile = "Act/Anim/P_Striker_B.act",name = "Justin"},
  {model = "PRH1a_Tad_GS",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Tad"},
  {model = "PRH1_Gord_GS",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Gord"},
  {model = "NDLead_Earnest_EG",style = "/Global/N_Ranged_A",styleFile = "Act/Anim/N_Ranged_A.act",name = "Earnest"},
  {model = "JKlead_Ted_EG",style = "/Global/J_Striker_A",styleFile = "Act/Anim/J_Striker_A.act",name = "Ted"},
  {model = "GRlead_Johnny_EG",style = "/Global/G_Johnny",styleFile = "Act/Anim/G_Johnny.act",name = "Johnny"},
  {model = "PRlead_Darby_EG",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Darby"},
  {model = "Dog_Pitbull2",style = "/Global/AN_DOG",styleFile = "Act/Anim/AN_DOG.act",name = "Pitbull"},
  {model = "Dog_Pitbull3",style = "/Global/AN_DOG",styleFile = "Act/Anim/AN_DOG.act",name = "Pitbull"},
  {model = "TE_CafeMU_W",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "Edna"},
  {model = "TO_Millworker",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "McInnis"},
  {model = "TO_Dockworker",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Johnson"},
  {model = "NDH2_Thad_PJ",style = "/Global/N_Ranged_A",styleFile = "Act/Anim/N_Ranged_A.act",name = "Thad"},
  {model = "GN_Lblkboy_PJ",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Sheldon"},
  {model = "GN_Hboy_PJ",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Pedro"},
  {model = "GN_Boy01_PJ",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Ivan"},
  {model = "GN_Boy02_PJ",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Trevor"},
  {model = "TE_Gym_Incog",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "MrBurton"},
  {model = "JK_Mandy_Towel",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Mandy"},
  {model = "JK_Bo_FB",style = "/Global/J_Melee_A",styleFile = "Act/Anim/J_Melee_A.act",name = "Bo"},
  {model = "JK_Casey_FB",style = "/Global/J_Melee_A",styleFile = "Act/Anim/J_Melee_A.act",name = "Casey"},
  {model = "PunchBag",style = "/Global/B_Striker_A",styleFile = "Act/Anim/B_Striker_A.act",name = "PunchBag"},
  {model = "TO_Cop3",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "OfficerMonson"},
  {model = "GN_GreekboyUW",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Constantinos"},
  {model = "TO_Construct01",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "McInnis"},
  {model = "TO_Construct02",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "McInnis"},
  {model = "TO_Cop4",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "OfficerWilliams"},
  {model = "PRH2_Bryce_OBOX_D1",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Bryce"},
  {model = "PRH2_Bryce_OBOX_D2",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Bryce"},
  {model = "PRH2A_Chad_OBOX_D1",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Chad"},
  {model = "PRH2A_Chad_OBOX_D2",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Chad"},
  {model = "PR2nd_Bif_OBOX_D2",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Bif"},
  {model = "PRH3_Justin_OBOX_D1",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Justin"},
  {model = "PRH3_Justin_OBOX_D2",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Justin"},
  {model = "PRH3a_Prkr_OBOX_D1",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Parker"},
  {model = "PRH3a_Prkr_OBOX_D2",style = "/Global/P_Striker_A",styleFile = "Act/Anim/P_Striker_A.act",name = "Parker"},
  {model = "TE_Geography",style = "/Global/Authority",styleFile = "Act/Anim/Authority.act",name = "GeographyTeacher"},
  {model = "TE_Music",style = "/Global/TE_Female_A",styleFile = "Act/Anim/TE_Female_A.act",name = "MusicTeacher"},
  {model = "TO_ElfF",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Elf 1"},
  {model = "TO_ElfM",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Elf 2"},
  {model = "TO_HoboSanta",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Santa 1"},
  {model = "TO_Santa",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Santa 2"},
  {model = "TO_Santa_NB",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Santa 3"},
  {model = "Peter_Nutcrack",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Peter"},
  {model = "GN_Fatgirl_Fairy",style = "/Global/GS_Fat_A",styleFile = "Act/Anim/GS_Fat_A.act",name = "Eunice"},
  {model = "GN_Lgirl_2_Flower",style = "/Global/GS_Female_A",styleFile = "Act/Anim/GS_Female_A.act",name = "Melody"},
  {model = "GN_Hboy_Flower",style = "/Global/GS_Male_A",styleFile = "Act/Anim/GS_Male_A.act",name = "Pedro"},
}
pi = 1
psi = 1

styles = {
  {name = "Player",style = "Player",allowGrapple = true},
  {name = "Davis",style = "1_03_Davis",allowGrapple = true},
  {name = "Dog",style = "AN_DOG",allowGrapple = true},
  {name = "Authority",style = "Authority",allowGrapple = true},
  {name = "Boss Darby",style = "BOSS_Darby",allowGrapple = true},
  {name = "Boss Russell",style = "BOSS_Russell",allowGrapple = true},
  {name = "Beta Russell",style = "Russell_102",allowGrapple = true},
  {name = "Boxing Player",style = "BoxingPlayer",allowGrapple = true},
  {name = "B_Striker_A",style = "B_Striker_A",allowGrapple = true},
  {name = "Crazy",style = "Crazy_Basic",allowGrapple = true},
  {name = "CV_Drunk",style = "CV_Drunk",allowGrapple = true},
  {name = "CV_Female_A",style = "CV_Female_A",allowGrapple = true},
  {name = "CV_Male_A",style = "CV_Male_A",allowGrapple = true},
  {name = "CV_OLD",style = "CV_OLD",allowGrapple = true},
  {name = "DO_Edgar",style = "DO_Edgar",allowGrapple = true},
  {name = "DO_Grappler_A",style = "DO_Grappler_A",allowGrapple = true},
  {name = "DO_Melee_A",style = "DO_Melee_A",allowGrapple = true},
  {name = "DO_Striker_A",style = "DO_Striker_A",allowGrapple = true},
  {name = "Fight Tutorial",style = "Fight_Tutorial",allowGrapple = true},
  {name = "GS_Fat_A",style = "GS_Fat_A",allowGrapple = true},
  {name = "GS_Female_A",style = "GS_Female_A",allowGrapple = true},
  {name = "GS_Male_A",style = "GS_Male_A",allowGrapple = true},
  {name = "G_Grappler_A",style = "G_Grappler_A",allowGrapple = true},
  {name = "G_Johnny",style = "G_Johnny",allowGrapple = true},
  {name = "G_Melee_A",style = "G_Melee_A",allowGrapple = true},
  {name = "G_Ranged_A",style = "G_Ranged_A",allowGrapple = true},
  {name = "G_Striker_A",style = "G_Striker_A",allowGrapple = true},
  {name = "Hobo Blocker",style = "Hobo_Blocker",allowGrapple = true},
  {name = "J_Grappler_A",style = "J_Grappler_A",allowGrapple = true},
  {name = "J_Melee_A",style = "J_Melee_A",allowGrapple = true},
  {name = "J_Striker_A",style = "J_Striker_A",allowGrapple = true},
  {name = "J_Ted",style = "J_Ted",allowGrapple = true},
  {name = "LE_Orderly_A",style = "LE_Orderly_A",allowGrapple = true},
  {name = "Nemesis/Gary",style = "Nemesis",allowGrapple = true},
  {name = "N_Earnest",style = "N_Earnest",allowGrapple = true},
  {name = "N_Ranged_A",style = "N_Ranged_A",allowGrapple = true},
  {name = "N_Striker_A",style = "N_Striker_A",allowGrapple = true},
  {name = "N_Striker_B",style = "N_Striker_B",allowGrapple = true},
  {name = "P_Bif",style = "P_Bif",allowGrapple = true},
  {name = "P_Grappler_A",style = "P_Grappler_A",allowGrapple = true},
  {name = "P_Striker_A",style = "P_Striker_A",allowGrapple = true},
  {name = "P_Striker_B",style = "P_Striker_B",allowGrapple = true},
  {name = "TE_Female_A",style = "TE_Female_A",allowGrapple = true},
  {name = "TE_Secretary",style = "TE_Secretary",allowGrapple = true},
  {name = "TO_Siamese",style = "TO_Siamese",allowGrapple = true},
  {name = "Training Player",style = "TrainingPlayer",allowGrapple = true},
  {name = "Wrestling",style = "WrestlingACT",allowGrapple = true},
}
si = 1