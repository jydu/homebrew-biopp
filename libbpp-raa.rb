class LibbppRaa < Formula
  desc "Bio++ RAA Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-raa/archive/v2.4.1.tar.gz"
  sha256 "db80c10aa1d333eae7a8d6b1216872f68fc82389dd0375000ae3ba670b1ebef9"
  
  depends_on "cmake" => :build
  depends_on "libzip"
  depends_on "libbpp-seq"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
