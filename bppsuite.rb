class Bppsuite < Formula
  desc "The Bio++ Program Suite"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bppsuite/releases/tag/v2.3.1"
  sha256 "f20b88c32558ad7ce376669e153992d4cb3680d79b01c6ceeb771cb5e42c1f64"
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
