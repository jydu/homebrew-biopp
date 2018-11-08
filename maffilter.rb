class Maffilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "https://github.com/jydu/maffilter/archive/v1.3.1.tar.gz"
  sha256 "d681384744c3d41660036dea3ef00bff3ea03795f9ae8275ceefd02a525602dc"

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
