class Maffilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "http://biopp.univ-montp2.fr/repos/sources/maffilter/MafFilter-1.0.0.tar.gz"
  sha256 "935d117340207beef42b74e72dd803b377bf62b41927cdd13d7cc667870f0760"

  depends_on "cmake" => :build
  depends_on "libbpp-phyl-omics"
  depends_on "boost"
  depends_on "libzip"
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "maffilter"
  end
end
