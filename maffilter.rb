class MafFilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "https://github.com/jydu/maffilter/releases/tag/v1.2.1"
  sha256 "d6b3604a34ea8bf097054e0f9b449ceae010df238c8760e884b5184dd6f2a28e"
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
