class Comap < Formula
  homepage "http://bioweb.me/comap"
  url "https://github.com/jydu/comap/archive/v1.5.4.tar.gz"
  sha256 "d47a83176a6fca9b00052dd877d0f719a1baeb833e16b1efa23958e4fe43e369"
  depends_on "cmake" => :build
  depends_on "libbpp-phyl"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "comap"
    system "mica"
  end
end
