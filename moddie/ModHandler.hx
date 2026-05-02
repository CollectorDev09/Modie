package moddie;

import sys.FileSystem;
import sys.io.File.*;
import haxe.Json;

class ModHandler
{
	public static function getAllMods()
	{
		var modsPath:Array<String> = FileSystem.readDirectory('mods');

		var mods:Array<String> = [];

		for (i in 0...modsPath.length)
		{
			if (FileSystem.isDirectory(Paths.mods(modsPath[i])))
			{
				mods.push(modsPath[i]);
			}
		}

		return mods;
	}

	public static function getMetadata(mod:String)
	{
		var daMeta:Array<String> = [];
		if (FileSystem.exists(Paths.mods(mod + '/meta.json')))
		{
			trace('Metadata found for: $mod');
			daMeta = Json.parse(getContent(Paths.mods('$mod/meta.json')));
		}
		else
		{
			trace('Could not find metadata for: $mod');
		}

		return daMeta;
	}
}