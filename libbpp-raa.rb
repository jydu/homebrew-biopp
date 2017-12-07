class LibbppRaa < Formula
  desc "Bio++ RAA Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-raa/archive/v2.3.1.tar.gz"
  sha256 "3fa94695c76d88fb3d28ebaa2bffcb688f59d302874ea9aa62e6e88f8544b06c"
  
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
