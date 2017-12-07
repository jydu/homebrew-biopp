class LibbppRaa < Formula
  desc "Bio++ RAA Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-raa/archive/v2.3.1.tar.gz"
  sha256 "6abcb159d22d88927c40182f3cf40285e7defae41fd66cafa45310d5fd3cf5be"
  
  depends_on "cmake" => :build
  depends_on "libzip"
  depends_on "libbpp-seq"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "bpp-raa-shared", "bpp-raa-static"
      system "make", "install"
    end
  end
end
