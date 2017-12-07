class Physamp < Formula
  homepage "http://bioweb.me/physamp"
  url "https://github.com/jydu/physamp/archive/v1.0.1.tar.gz"
  sha256 "1631bb2af9273c8830f1df4c02ca561c6a03bcc29e5d37074e2d3c26ae557111"

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
