class LibbppPhylOmics < Formula
  homepage "http://biopp.univ-montp2.fr/"
  url "http://biopp.univ-montp2.fr/repos/sources/bpp-phyl-omics-2.2.0.tar.gz"
  sha256 "a48f4c6f0ea1758c1f6dc8a262d5cbad95769739d46ce9af08527107a548bfaa"

  depends_on "cmake" => :build
  depends_on "libbpp-seq-omics"
  depends_on "libbpp-phyl"

  def install
    system "cmake", ".", *std_cmake_args, "-DBUILD_TESTING=no"
    system "make", "install"
  end
end
