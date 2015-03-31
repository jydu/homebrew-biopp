class Maffilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "http://biopp.univ-montp2.fr/repos/sources/maffilter/maffilter-1.1.1.tar.gz"
  sha256 "25aceee0ac924bc8528bf2e581fdd547f4bd1569328dbc4d50a698dd39730e97"

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
