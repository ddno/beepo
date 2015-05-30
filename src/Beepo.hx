import sys.io.Process;

using StringExtender;

class Beepo {
	private static var timeout = 2.0;
	private static var doBeep = true;
	private static var sayMessage = "";
	private static var verboseLevel = 0;
	private static var beepTimes = 0;
	private static var processExists = "";
	private static var processDontExists = "";

	public static function main() {
		var args = Sys.args();

		_setVerboseLevel(args);

		while (args.length > 0) {
			var arg = args.shift();

			switch (arg) {
				case "-v":
					args.shift();
				case "-t":
					timeout = Std.parseFloat(args.shift());
				case "-nb":
					doBeep = false;
				case "-say":
					_output("Will use say command", 1);
					sayMessage = args.shift();
					doBeep = false;
				case "-p":
					processExists = args.shift();
					_output("Will check if process: " + processExists + " exists", 1);
				case "-np":
					processDontExists = args.shift();
					_output("Will check if process " + processDontExists + " no longer exists", 1);
				case "-bt":
					beepTimes = Std.parseInt(args.shift());
				case "help":
					Instructions.print();
					Sys.exit(0);
				case "-version", "--version":
					Sys.println("beepo version 1.0. Created by Daniel Nordström 2015");
					Sys.exit(0);
				default:
					Sys.println("Unsupported argument: " + arg);
					Sys.exit(1);
			}
		}

		_output('Set timeout: $timeout seconds', 2);

		var timesBeeped = 0;
		while (true) {
			Sys.sleep(timeout);

			if (processDontExists != "" && _doProcessExist(processDontExists)) {
				continue;
			}
			if (processExists != "" && ! _doProcessExist(processExists)) {
				continue;
			}

			if (doBeep) {
				Sys.print("Beep (press CTRL + C to abort)");
				Sys.command("echo \"\\a\"");
			}
			if (sayMessage != "") {
				Sys.command("say \"" + sayMessage + "\"");
			}

			if (beepTimes > 0 && ++timesBeeped >= beepTimes) {
				_output("Finished beeping", 1);
				Sys.exit(0);
			}
		}
	}
	private static function _doProcessExist(processName:String) {
		var processOutput = _runCommand("ps", ["aux"]);
		var filteredOutput = "";
		for (line in processOutput.split("\n")) {
			if ( ! line.contains("beepo")) { // TODO check for beepo pid instead?
				filteredOutput += line + "\n";
			}
		}

		_output("Current processes:", 2);
		_output(filteredOutput, 2);

		return filteredOutput.contains(processName);
	}
	private static function _runCommand(cmd:String, args:Array<String>) {
		var process:Process = new Process(cmd, args);
		var results = process.stdout.readAll().toString();
		process.close();
		return results;
	}
	private static function _setVerboseLevel(args:Array<String>) {
		var argCount = 0;
		for (arg in args) {
			if (arg == "-v") {
				verboseLevel = Std.parseInt(args[argCount + 1]);
			}
			argCount++;
		}
	}
	private static function _output(msg:String, level:Int) {
		if (verboseLevel >= level) {
			Sys.println(msg);
		}		
	}
}

