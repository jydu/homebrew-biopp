class Bppsuite < Formula
  desc "The Bio++ Program Suite"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bppsuite/archive/v2.4.0.tar.gz"
  sha256 "1eba19f678a4026bd8ce29c9a475d1e5452ecbee4c971dd2dc8167528d992de2"
  
  depends_on "cmake" => :build
  depends_on "libbpp-phyl"
  depends_on "libbpp-popgen"
 
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
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
