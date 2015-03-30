class LibbppSeqOmics < Formula
  homepage "http://biopp.univ-montp2.fr/"
  url "http://biopp.univ-montp2.fr/repos/sources/bpp-seq-omics-2.2.0.tar.gz"
  sha256 "1cc6a4bc256bbb90d3371c45b0b4b6be6503e1bf5ce702052875ac1cb4b9a13b"

  depends_on "cmake" => :build
  depends_on "libbpp-seq"

  def install
    system "cmake", ".", *std_cmake_args, "-DBUILD_TESTING=no"
    system "make", "install"
  end
end
