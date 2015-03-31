class Maffilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "http://biopp.univ-montp2.fr/repos/sources/maffilter/maffilter-1.1.1.tar.gz"
  sha256 "eb269d71ff769f79485179cc4a50a82178f0e827d4cc40419723605d651b5fba"
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
