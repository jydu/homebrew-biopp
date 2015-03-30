class LibbppPhyl < Formula
  homepage "http://biopp.univ-montp2.fr/"
  url "http://biopp.univ-montp2.fr/repos/sources/bpp-phyl-2.2.0.tar.gz"
  sha256 "f346d87bbc7858924f3c99d7d74eb4a1f7a1b926746c68d8c28e07396c64237b"

  depends_on "cmake" => :build
  depends_on "libbpp-seq"

  def install
    system "cmake", ".", *std_cmake_args, "-DBUILD_TESTING=no"
    system "make", "install"
  end
end
