class Comap < Formula
  homepage "http://bioweb.me/comap"
  url "http://biopp.univ-montp2.fr/repos/sources/comap/comap-1.5.2.tar.gz"
  sha256 "c4769ea64fd0441528e5fe9707fecc726ab7790c72698d4c432452de62d3763f"
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
