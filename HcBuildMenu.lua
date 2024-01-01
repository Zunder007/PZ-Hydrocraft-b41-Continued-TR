Hydrocraft = {}

HcMenu = HcMenu or {}; 
HcMenu._index = HcMenu


Hydrocraft.doBuildMenus = function(_player, _context, _worldObjects)

	local player = _player;
	local context = _context;
	local worldobjects = _worldObjects;
	local HcMenuOption = context:addOption("Construction", worldobjects);
	local HcSubMenu = ISContextMenu:getNew(context);
	context:addSubMenu(HcMenuOption, HcSubMenu);

	Hydrocraft.BuildOptionGlassRoof(player, HcSubMenu)
	Hydrocraft.BuildOptionSteelStairs (player, HcSubMenu)
	Hydrocraft.BuildOptionGlassWall (player, HcSubMenu)
	Hydrocraft.BuildOptionWallBrick (player, HcSubMenu)
	Hydrocraft.BuildOptionWallBrickWin (player, HcSubMenu)
	Hydrocraft.BuildOptionIBCTower (player, HcSubMenu)
	Hydrocraft.BuildOptionKiln (player, HcSubMenu)
	Hydrocraft.BuildOptionHerbaltable (player, HcSubMenu)
	Hydrocraft.BuildOptionCellar (player, HcSubMenu)
	Hydrocraft.BuildOptionGrindstone (player, HcSubMenu)
	Hydrocraft.BuildOptionTarkiln (player, HcSubMenu)
	Hydrocraft.BuildOptionCarpybench (player, HcSubMenu)
	Hydrocraft.BuildOptionWaterPump(player, HcSubMenu)

	HcMenuOption = context:addOption("Apiculture", worldobjects);
	HcSubMenu = ISContextMenu:getNew(context);


	context:addSubMenu(HcMenuOption, HcSubMenu);
	Hydrocraft.RanchingOptionBeehive(player, HcSubMenu)

end



Hydrocraft.RanchingOptionBeehive = function(player, HcSubMenu)
	local option
	local tooltip
	option = HcSubMenu:addOption("Ruche", nil, function() Hydrocraft.onBuildBeehive(player)  end);
	tooltip = Hydrocraft.toolTipcheck(option)
	tooltip:setName("Ruche")
	tooltip.description = "Une ruche pour le miel"
	local inv = getSpecificPlayer(player):getInventory()
	local beehive_count = inv:getItemCount("Hydrocraft.HCBeehive3")
	local rgb = ""
	if beehive_count > 0 then rgb = "<RGB:1,1,1>"
	else rgb = "<RGB:1,0,0>" end
	tooltip.description = tooltip.description.."<LINE>"..rgb..string.format("%s: %i / 1", "Ruche", beehive_count)
	tooltip:setTexture("hcBuildingBeehive_00_0")
end


Hydrocraft.onBuildBeehive = function(player)
	local beehive = Beehive:new(player, "hcBuildingBeehive_00_0", Beehive.HoneyMax);
	beehive.modData["need:Hydrocraft.HCBeehive3"] = "1";
	-- beehive.modData["need:Base.Nails"] = "1";
	beehive.player = player
	beehive.skipBuildAction = true
	beehive.noNeedHammer = true;
	getCell():setDrag(beehive, player);
end



Hydrocraft.BuildOptionSteelStairs  = function(player, HcSubMenu)
local option
local tooltip
sprite = {}
sprite.upToLeft01 = "fixtures_stairs_01_3"
sprite.upToLeft02 = "fixtures_stairs_01_4"
sprite.upToLeft03 = "fixtures_stairs_01_5"
sprite.upToRight01 = "fixtures_stairs_01_11"
sprite.upToRight02 = "fixtures_stairs_01_12"
sprite.upToRight03 = "fixtures_stairs_01_13"
sprite.pillar = "fixtures_stairs_01_14"
sprite.pillarNorth = "fixtures_stairs_01_14"
	
option = HcSubMenu:addOption("Escalier en acier", nil, function() Hydrocraft.onBuildMetalStairs(sprite,player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Escalier en acier")
tooltip.description = "<RGB:1,1,1>Masque de soudeur <LINE>Chalumeau au propane <LINE>Barre en acier: 2 <LINE> Barre en acier: 6 <LINE> Plaque en acier: 5"
tooltip:setTexture(sprite.upToLeft01)
end


Hydrocraft.BuildOptionGlassRoof  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Toit en verre", nil, function() Hydrocraft.onBuildGlassRoof(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Toit en verre")
tooltip.description = "<RGB:1,1,1>Masque de soudeur <LINE>Chalumeau au propane <LINE> Barre en acier: 2 <LINE> Vitre: 1"
tooltip:setTexture("roofs_02_55")
end

Hydrocraft.BuildOptionGlassWall  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Mur en verre", nil, function() Hydrocraft.onBuildGlassWall(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Mur en verre")
tooltip.description = "<RGB:1,1,1>Masque de soudeur <LINE>Chalumeau au propane <LINE> Barre en acier: 3 <LINE> Grande vitre: 1"
tooltip:setTexture("walls_commercial_01_97")
end

Hydrocraft.BuildOptionWallBrick  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Mur de briques", nil, function() Hydrocraft.onBuildWallBrick(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Mur de briques")
tooltip.description = "<RGB:1,1,1>Truelle<LINE> Ciment: 1 <LINE>Briques rouges: 22 <LINE>Briques grises: 18 <LINE>Pierres: 20"
tooltip:setTexture("walls_exterior_house_02_65")
end


Hydrocraft.BuildOptionWallBrickWin  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Mur de briques avec vitre", nil, function() Hydrocraft.onBuildWallBrickWin(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Mur de briques avec vitre")
tooltip.description = "<RGB:1,1,1>Truelle<LINE> Ciment: 1 <LINE>Briques rouges: 18 <LINE>Briques grises: 15 <LINE>Pierres: 20"
tooltip:setTexture("walls_exterior_house_02_73")
end


Hydrocraft.BuildOptionIBCTower  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Cuve pour eau de pluie", nil, function() Hydrocraft.onBuildIBCTower(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Cuve pour eau de pluie")
tooltip.description = "<RGB:1,1,1>Une cuve pour eau de pluie"
tooltip:setTexture("hcBuildingIBCTower_01_0") --old image: "carpentry_02_52"
end



Hydrocraft.BuildOptionKiln  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Four", nil, function() Hydrocraft.onBuildKiln(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Four")
tooltip.description = "<RGB:1,1,1>Un four pour poterie"
tooltip:setTexture("hcBuildingKiln_01_0")
end

Hydrocraft.onBuildKiln = function(player)
local kiln = ISSimpleFurniture:new("Four", "hcBuildingKiln_01_0", "hcBuildingKiln_01_0");
kiln.isContainer = true;
kiln.canBeAlwaysPlaced = true;
kiln.modData["need:Hydrocraft.HCKiln"] = "1";
kiln.player = player
getCell():setDrag(kiln, player);
end


Hydrocraft.BuildOptionCarpybench  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Table de travail pour charpentier", nil, function() Hydrocraft.onBuildCarpybench(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Table de travail pour charpentier")
tooltip.description = "<RGB:1,1,1>Une table de travail pour charpentier"
tooltip:setTexture("hcBuildingCarpBench_01_0")
end

Hydrocraft.onBuildCarpybench = function(player)
local carpybench = ISDoubleTileFurniture:new("Table de travail pour charpentier", "hcBuildingCarpBench_02_0", "hcBuildingCarpBench_01_0", "hcBuildingCarpBench_12_0", "hcBuildingCarpBench_11_0");
carpybench.isContainer = true;
carpybench.canBeAlwaysPlaced = true;
carpybench.modData["need:Hydrocraft.HCCarpenterbench"] = "1";
carpybench.player = player
carpybench.completionSound = "BuildWoodenStructureLarge";
getCell():setDrag(carpybench, player);
end


Hydrocraft.BuildOptionHerbaltable  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Table de travail pour herboriste", nil, function() Hydrocraft.onBuildHerbaltable(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Table de travail pour herboriste")
tooltip.description = "<RGB:1,1,1>Une table de travail pour herboriste"
tooltip:setTexture("hcBuildingHerbtable_01_0")
end



Hydrocraft.BuildOptionCellar  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Cave", nil, function() Hydrocraft.onBuildCellar(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Cave")
tooltip.description = "<RGB:1,1,1>Une immense cave de stockage"
tooltip:setTexture("hcBuildingCellar_01_0")
end

Hydrocraft.onBuildCellar = function(player)
local cellar = ISSimpleFurniture:new("Cave", "hcBuildingCellar_01_0", "hcBuildingCellar_01_0");
cellar.isContainer = true;
cellar.modData["need:Hydrocraft.HCCellar"] = "1";
cellar:setEastSprite("hcBuildingCellar_01_0");
cellar:setSouthSprite("hcBuildingCellar_01_0");
cellar:setNorthSprite ("hcBuildingCellar_01_0");
cellar.player = player
getCell():setDrag(cellar, player);
end


Hydrocraft.BuildOptionGrindstone  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Meule", nil, function() Hydrocraft.onBuildGrindstone(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Meule")
tooltip.description = "<RGB:1,1,1>Un mortier et pilon"
tooltip:setTexture("hcBuildingGrindstone_01_0")
end


Hydrocraft.BuildOptionTarkiln  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Four a goudron", nil, function() Hydrocraft.onBuildTarkiln(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Four a goudron")
tooltip.description = "<RGB:1,1,1>Un four pour faire du goudron"
tooltip:setTexture("hcBuildingTarkiln_01_0")
end

Hydrocraft.BuildOptionWaterPump = function(player, HcSubMenu)
	local option
	local tooltip
	option = HcSubMenu:addOption("Pompage de l'eau", nil, function() Hydrocraft.onBuildWaterPump(player) end);
	tooltip = Hydrocraft.toolTipcheck(option)
	tooltip:setName("Pompage de l'eau")
	tooltip.description = "<RGB:1,1,1>Une pompe pour puiser de l'eau"
	tooltip:setTexture("hcBuildingWaterPump_01_0")
end


-- *********************** BuildingFunctions ********************


Hydrocraft.onBuildTarkiln = function(player)
local tarkiln = ISSimpleFurniture:new("Four a goudron", "hcBuildingTarkiln_01_0", "hcBuildingTarkiln_01_0");
tarkiln.isContainer = true;
tarkiln.canBeAlwaysPlaced = true;
tarkiln.modData["need:Hydrocraft.HCTarkiln"] = "1";
tarkiln:setEastSprite("hcBuildingTarkiln_01_0");
tarkiln:setSouthSprite("hcBuildingTarkiln_01_0");
tarkiln:setNorthSprite ("hcBuildingTarkiln_01_0");
tarkiln.player = player
getCell():setDrag(tarkiln, player);
end


Hydrocraft.onBuildGrindstone = function(player)
local grindstone = ISSimpleFurniture:new("Meule", "hcBuildingGrindstone_01_0", "hcBuildingGrindstone_01_0");
grindstone.isContainer = true;
grindstone.canBeAlwaysPlaced = true;
grindstone.modData["need:Hydrocraft.HCGrindstone"] = "1";
grindstone:setEastSprite("hcBuildingGrindstone_01_0");
grindstone:setSouthSprite("hcBuildingGrindstone_01_0");
grindstone:setNorthSprite ("hcBuildingGrindstone_01_0");
grindstone.player = player
getCell():setDrag(grindstone, player);
end


Hydrocraft.onBuildHerbaltable = function(player)
local herbtab = ISSimpleFurniture:new("Table de travail pour herboriste", "hcBuildingHerbtable_01_0", "hcBuildingHerbaltable_01_0");
herbtab.isContainer = true;
herbtab.canBeAlwaysPlaced = true;
herbtab.modData["need:Hydrocraft.HCHerbtable"] = "1";
herbtab:setEastSprite("hcBuildingHerbtable_01_0");
herbtab:setSouthSprite("hcBuildingHerbtable_01_0");
herbtab:setNorthSprite ("hcBuildingHerbtable_01_0");
herbtab.player = player
getCell():setDrag(herbtab, player);
end




Hydrocraft.onBuildIBCTower = function(player)
local barrel = RainCollectorBarrel:new(player, "hcBuildingIBCTower_01_0", 2000);
	barrel.modData["need:Hydrocraft.HCIBCtower"] = "1";
	barrel.player = player
	getCell():setDrag(barrel, player);
end


Hydrocraft.onBuildWallBrickWin = function(player)
local wall = ISWoodenWall:new("walls_exterior_house_02_72","walls_exterior_house_02_73", nil);
wall.player = player
wall.name = "Mur de briques avec vitre"
wall.canBarricade = true
wall.hoppable = true

wall.modData["need:Hydrocraft.HCGreybrick"] = "15";
wall.modData["need:Hydrocraft.HCRedbrick"] = "18";
wall.modData["need:Base.Stone"] = "20";
wall.modData["need:Hydrocraft.HCMortar"] = "1";


wall.firstItem = "Hydrocraft.HCMasontrowel";
wall.health = 700;
getCell():setDrag(wall, player);
end



Hydrocraft.onBuildWallBrick = function(player)
local wall = ISWoodenWall:new("walls_exterior_house_02_64","walls_exterior_house_02_65", nil);
wall.player = player
wall.name = "Mur de briques"
wall.canBarricade = false
wall.hoppable = false

wall.modData["need:Hydrocraft.HCGreybrick"] = "18";
wall.modData["need:Hydrocraft.HCRedbrick"] = "22";
wall.modData["need:Base.Stone"] = "20";
wall.modData["need:Hydrocraft.HCMortar"] = "1";

wall.firstItem = "Hydrocraft.HCMasontrowel";
wall.health = 700;
getCell():setDrag(wall, player);
end


Hydrocraft.onBuildMetalStairs = function(sprite,player)

local stairs = ISWoodenStairs:new(sprite.upToLeft01, sprite.upToLeft02, sprite.upToLeft03, sprite.upToRight01, sprite.upToRight02, sprite.upToRight03, sprite.pillar, sprite.pillarNorth)
stairs.isThumpable = false
stairs.player = player
stairs.name = "Escalier en acier"
stairs.modData["need:Hydrocraft.HCSteelpole"] = "2"
stairs.modData["need:Hydrocraft.HCSteelrod"] = "6"
stairs.modData["need:Hydrocraft.HCSteelsheet"] = "5"

stairs.firstItem = "BlowTorch";
stairs.secondItem = "WeldingMask";
stairs.craftingBank = "BlowTorch";
stairs.modData["use:Base.BlowTorch"] = torchUse;
stairs.modData["xp:MetalWelding"] = 20;
stairs.noNeedHammer = true;
stairs.health = 120;
getCell():setDrag(stairs, player);
end


Hydrocraft.onBuildGlassRoof = function(player)
local floor = ISWoodenFloor:new("roofs_02_55","roofs_02_55");
floor.player = player
floor.name = "Toit en verre"

floor.modData["need:Hydrocraft.HCSteelrod"] = "2"
floor.modData["need:Hydrocraft.HCGlasspane"] = "1"

floor.firstItem = "BlowTorch";
floor.secondItem = "WeldingMask";
floor.craftingBank = "BlowTorch";
floor.modData["use:Base.BlowTorch"] = torchUse;
floor.modData["xp:MetalWelding"] = 10;
floor.noNeedHammer = true;
floor.health = 10;
getCell():setDrag(floor, player);
end


Hydrocraft.onBuildGlassWall = function(player)
local wall = ISWoodenWall:new("walls_commercial_01_96","walls_commercial_01_97", nil);
wall.player = player
wall.name = "Mur en verre"
wall.canBarricade = false
wall.hoppable = false

wall.modData["need:Hydrocraft.HCSteelrod"] = "3"
wall.modData["need:Hydrocraft.HCGlasspanelarge"] = "1"

wall.firstItem = "BlowTorch";
wall.secondItem = "WeldingMask";
wall.craftingBank = "BlowTorch";
wall.modData["use:Base.BlowTorch"] = torchUse;
wall.modData["xp:MetalWelding"] = 10;
wall.noNeedHammer = true;
wall.health = 10;
getCell():setDrag(wall, player);
end

Hydrocraft.onBuildWaterPump = function(player)
	local pump = WaterPump:new(player, "hcBuildingWaterPump_01_0", WaterPump.waterMax);
	pump.modData["need:Hydrocraft.HCWaterpump"] = "1";
	pump.player = player
	getCell():setDrag(pump, player);
end




Hydrocraft.toolTipcheck = function(option)

	local _tooltip = ISToolTip:new()
	_tooltip:initialise()
	_tooltip:setVisible(false)
	option.toolTip = _tooltip

	return _tooltip
end




local function func_Init()
	Events.OnFillWorldObjectContextMenu.Add(Hydrocraft.doBuildMenus)
end

Events.OnGameStart.Add(func_Init)




