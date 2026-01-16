def bin_exists [name] {
	return ((which $name | length) > 0)
}
