class Instructions {
	public static function print() {
		var instructions = 'usage: beepo [args]

		Arguments:
		-t {num}	Time between each beep, in seconds
		-bt {num} 	Times to beep before exiting
		-say "Words"	Words to say using say command
		-p {process}	Start beeping when process exists
		-np {process}	Start beeping when process no longer exists
		-nb		Disable beeping sound
		-v {num}	Verbosity level (0 - 2)
		-version	Print current version

		Examples:

		Start beeping after commands before are completed:
		    make;make install;beepo

		Beep five times once process containing \"Build.xml\" no longer exists:
		    beepo -bt 5 -np Build.xml 

		Beep every 0.2 seconds with full verbosity once process containing \"Build.xml\" exists
		    beepo -t 0.2 -v 2 -p Build.xml
		';

		var startingTabs = ~/^(\t)+/gm;
		instructions = startingTabs.replace(instructions, "");

		Sys.println(instructions);
	}
}

