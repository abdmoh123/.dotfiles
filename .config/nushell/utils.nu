def bin_exists [name] {
	if (which $name | is-empty) { return false }
	return ((which $name | first).path | path exists)
}
