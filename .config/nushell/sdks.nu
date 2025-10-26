# flutter
let flutter_path = "~/SDKs/flutter/bin"
if ($flutter_path | path exists) {
	$env.PATH = $env.PATH | prepend $flutter_path
}
