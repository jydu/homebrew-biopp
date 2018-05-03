class Physamp < Formula
  homepage "http://bioweb.me/physamp"
  url "https://github.com/jydu/physamp/archive/v1.1.0.tar.gz"
  sha256 "0c687e7f46d6d5732a3ad6f029a0169667921101294a9fb5efaae9adfc397ae8"

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
