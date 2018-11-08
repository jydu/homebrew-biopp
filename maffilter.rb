class Maffilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "https://github.com/jydu/maffilter/archive/v1.3.1.tar.gz"
  sha256 "b4a03152d6cb3fa78d6406a6500a89b76d4fb6ff1a0f7260939094a66453eb75"

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
