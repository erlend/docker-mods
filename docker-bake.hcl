variable "TS_VERSION" {
  default = "1.36.2"
}

target "default" {
  args = { TS_VERSION = TS_VERSION }
  output = ["type=docker"]
  tags = ["erlend/mods:tailscale", "erlend/mods:tailscale-${TS_VERSION}"]
}

target "release" {
  inherits = ["default"]
  output = ["type=registry"]
  platforms = ["linux/amd64", "linux/arm64", "linux/armhf"]
}
