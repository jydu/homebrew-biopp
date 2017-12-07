class Bppsuite < Formula
  desc "The Bio++ Program Suite"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bppsuite/releases/tag/v2.3.1"
  sha256 "cb93ff5d470ad0284bb8fb2eca67783d0afd4c91b22aa3a74450af6c6d28f538"
  depends_on "cmake" => :build
  depends_on "libbpp-phyl"
  depends_on "libbpp-popgen"
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "bppml"
    system "bpppopstats"
    system "bppdist"
    system "bppseqgen"
    system "bppseqman"
    system "bpppars"
    system "bppalnscore"
  end
end
