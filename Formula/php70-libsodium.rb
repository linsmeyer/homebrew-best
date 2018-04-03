require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Libsodium < AbstractPhp70Extension
  init
  desc "Modern and easy-to-use crypto library"
  homepage "https://github.com/jedisct1/libsodium-php"
  url "https://github.com/jedisct1/libsodium-php/archive/1.0.6.tar.gz"
  sha256 "537944529e7c591e4bd6c73f37e926e538e8ff1f6384747c301436fb78269b9c"
  head "https://github.com/jedisct1/libsodium-php.git"

  bottle do
    cellar :any
    sha256 "3425f456238fa32050cbc15fa94d5ba6a1dbe9b9f310ca18639917867ad4c139" => :el_capitan
    sha256 "b08c9abb4831c729e3cbaf8e25d3ce4afc5a13001e91050bfab044794d52c49e" => :yosemite
    sha256 "21ce16f007bbf2554c6536aa5a704d319dcce40b644e88157c1698acdfe0e670" => :mavericks
  end

  depends_on "libsodium"

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/libsodium.so"
    write_config_file if build.with? "config-file"
  end
end
