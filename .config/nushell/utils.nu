def bin_exists [name] {
	return ((which $name | length) > 0)
}

def is_distrobox [] {
	sudo ls "/root/.distrobox_init_done" | complete | get exit_code | $in == 0
}
