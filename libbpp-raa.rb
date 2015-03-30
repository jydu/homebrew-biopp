class LibbppRaa < Formula
  homepage "http://biopp.univ-montp2.fr/"
  url "http://biopp.univ-montp2.fr/repos/sources/bpp-raa-2.2.0.tar.gz"
  sha256 "c7ec73a5af84808362f301479c548b6a01c47a66065b28a053ff8043409e861a"

  depends_on "cmake" => :build
  depends_on "libzip"
  depends_on "libbpp-seq"

  def install
    system "cmake", ".", *std_cmake_args, "-DBUILD_TESTING=no"
    system "make", "install"
  end
end
