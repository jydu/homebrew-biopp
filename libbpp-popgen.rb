class LibbppPopgen < Formula
  homepage "http://biopp.univ-montp2.fr/"
  url "http://biopp.univ-montp2.fr/repos/sources/bpp-popgen-2.2.0.tar.gz"
  sha256 "f489a42b6d16b747af63f69ac1681d6b5de1b5b4511a2ac313f187a58fa5ede1"

  depends_on "cmake" => :build
  depends_on "libbpp-seq"

  def install
    system "cmake", ".", *std_cmake_args, "-DBUILD_TESTING=no"
    system "make", "install"
  end
end
