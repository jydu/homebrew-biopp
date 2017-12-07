class Maffilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "https://github.com/jydu/maffilter/releases/tag/v1.2.1"
  sha256 "b1f4a01712bf0f1be9810f6cd221a3c6732c8e3d0e7288da0d88025c7c1d69e2"
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
