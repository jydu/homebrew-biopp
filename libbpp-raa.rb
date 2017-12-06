class LibbppRaa < Formula
  desc "Bio++ RAA Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-raa/archive/v2.3.1.tar.gz"
  sha256 "c7ec73a5af84808362f301479c548b6a01c47a66065b28a053ff8043409e861a"

  depends_on "cmake" => :build
  depends_on "libzip"
  depends_on "libbpp-seq"

  def install
    resource(r).stage do
      mkdir "build" do
        system "cmake", "..", *std_cmake_args
        system "make", "#{r}-shared", "#{r}-static"
        system "make", "install"
      end
    end
  end
end
