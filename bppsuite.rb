class BppSuite < Formula
  desc "The Bio++ Program Suite"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bppsuite/releases/tag/v2.3.1"
  sha256 "4a5075d0c21f5ee880d31813349bebcdb5033250b7c364d578ddba1ff1a75f98"
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
