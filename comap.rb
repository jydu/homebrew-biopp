class Comap < Formula
  homepage "http://bioweb.me/comap"
  url "https://github.com/jydu/comap/releases/tag/v1.5.4"
  sha256 "c53d9599345162dd70b87dacb5646ac2d81516ae86081554fdcfc53084599cf3"
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
