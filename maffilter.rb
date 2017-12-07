class Maffilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "https://github.com/jydu/maffilter/releases/tag/v1.2.1"
  sha256 "764e23e507a546a1db37f656daee9e3d3e0b0bc12c18333400fb0e9ede22f5d3"
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
