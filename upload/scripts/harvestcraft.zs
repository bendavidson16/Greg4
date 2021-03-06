// --- Created by Jason McRay Edited by EconBrony --- 

import mods.nei.NEI;
import mods.gregtech.Centrifuge;
import minetweaker.item.IItemStack;

# Aliases
var piston = <minecraft:piston>;
var plateSteel = <ore:plateSteel>;
var presser = <harvestcraft:presser>;
var sink = <harvestcraft:sink:*>;
var waterFresh = <harvestcraft:freshwaterItem>;
var cotton = <harvestcraft:cottonItem>;
var saltPHC = <harvestcraft:saltItem>;
var saltGT = <gregtech:gt.metaitem.01:2817>;
var foodSalt = <ore:foodSalt>;
var itemSalt = <ore:itemSalt>;
var dustSalt = <ore:dustSalt>;
var rawRabbit = <harvestcraft:rabbitrawItem>;
var rawVenison = <harvestcraft:venisonrawItem>;
var cookedRabbit = <harvestcraft:rabbitcookedItem>;
var cookedVenison = <harvestcraft:venisoncookedItem>;
var fishingtrapBait = <harvestcraft:fishtrapbaitItem>;
//var string = <minecraft:string>;
var fishBait = <ore:listAllFishBait>;

var cookedMeat = [cookedRabbit, cookedVenison] as IItemStack[];
var rawMeat = [rawRabbit, rawVenison] as IItemStack[];

# Blocks/Items Removal
recipes.remove(sink);
sink.addTooltip(format.red(format.bold("This item is DISABLED!")));

# Recipe Tweaks
recipes.remove(presser);
recipes.addShaped(presser, [
	[plateSteel, piston, plateSteel],
	[plateSteel, null, plateSteel],
	[plateSteel, piston, plateSteel]]);
    
# Recipe Fixes
recipes.remove(cotton);
recipes.addShapeless(cotton * 2, [cotton, cotton]);

# Oredictionary
foodSalt.remove(saltPHC);
itemSalt.remove(saltPHC);
dustSalt.remove(saltPHC);
itemSalt.remove(saltGT);
dustSalt.remove(saltGT);

# Cooking Food
furnace.addRecipe(cookedRabbit, rawRabbit);
furnace.addRecipe(cookedVenison, rawVenison);

# Centrifuging Food
for meat in rawMeat {
    Centrifuge.addRecipe([null], null, meat, null, <liquid:methane> * 96, [0], 384, 5);
    }

for meat in cookedMeat {
    Centrifuge.addRecipe([null], null, meat, null, <liquid:methane> * 72, [0], 288, 5);
    }
    
# Grub as fish bait
fishBait.addAll(<ore:listAllfishraw>);
fishBait.addAll(<ore:grubBee>);
recipes.remove(fishingtrapBait);
recipes.addShapeless(fishingtrapBait * 4, [<minecraft:string>, fishBait, fishBait, fishBait]);

// Fish Oil
mods.gregtech.FluidExtractor.addRecipe(null, <harvestcraft:charrrawItem>, <liquid:fishoil> * 60, 6000, 100, 4);
mods.gregtech.FluidExtractor.addRecipe(null, <harvestcraft:herringrawItem>, <liquid:fishoil> * 70, 6000, 200, 4);
mods.gregtech.FluidExtractor.addRecipe(null, <harvestcraft:carprawItem>, <liquid:fishoil> * 80, 6000, 300, 4);
mods.gregtech.FluidExtractor.addRecipe(null, <harvestcraft:tilapiarawItem>, <liquid:fishoil> * 60, 6000, 100, 4);
mods.gregtech.FluidExtractor.addRecipe(null, <harvestcraft:troutrawItem>, <liquid:fishoil> * 100, 6000, 400, 4);
mods.gregtech.FluidExtractor.addRecipe(null, <harvestcraft:tunarawItem>, <liquid:fishoil> * 70, 6000, 100, 4);
mods.gregtech.FluidExtractor.addRecipe(null, <harvestcraft:snapperrawItem>, <liquid:fishoil> * 20, 6000, 100, 4);
mods.gregtech.FluidExtractor.addRecipe(null, <harvestcraft:perchrawItem>, <liquid:fishoil> * 90, 6000, 400, 4);
mods.gregtech.FluidExtractor.addRecipe(null, <freshwatermobs:silexmeatraw>, <liquid:fishoil> * 100, 6000, 100, 4);
