class Physamp < Formula
  homepage "http://bioweb.me/physamp"
  url "https://github.com/jydu/physamp/archive/v1.0.1.tar.gz"
  sha256 "60ab34b0bde5131b380da719c06c29e71cbe326352d837450e2d9ac611fdd1cb"

  depends_on "cmake" => :build
  depends_on "libbpp-phyl"
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "bppphysamp"
    system "bppalnoptim"
  end
end
