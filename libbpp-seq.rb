class LibbppSeq < Formula
  homepage "http://biopp.univ-montp2.fr/"
  url "http://biopp.univ-montp2.fr/repos/sources/bpp-seq-2.2.0.tar.gz"
  sha256 "0927d7fb0301c1b99a7353d5876deadb4a3040776cc74e8fe1c366fe920e7b6b"

  depends_on "cmake" => :build
  depends_on "libbpp-core"

  def install
    system "cmake", ".", *std_cmake_args, "-DBUILD_TESTING=no"
    system "make", "install"
  end
end
