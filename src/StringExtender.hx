class StringExtender {
	public static function contains(haystack:String, needle:String) {
		return haystack.toLowerCase().indexOf(needle.toLowerCase()) > 0;
	}
}

