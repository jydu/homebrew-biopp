class Maffilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "http://biopp.univ-montp2.fr/repos/sources/maffilter/maffilter-1.0.0.tar.gz"
  sha256 "c9ee39981766d3ac339df4b269dd57f39240a5597f1e527da030b80b85caa935"

  depends_on "cmake" => :build
  depends_on "libbpp-phyl-omics"
  depends_on "boost"
  depends_on "libzip"
  depends_on "bzip2"
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "maffilter"
  end
end
