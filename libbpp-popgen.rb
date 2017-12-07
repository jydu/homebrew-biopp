class LibbppPopgen < Formula
  desc "Bio++ Population Genetics Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-popgen/archive/v2.3.1.tar.gz"
  sha256 "35edfbe0c88cb7ea7ebcecdf7355ca77d4376ab7b543468e6ee1f3c97f21ac79"

  depends_on "cmake" => :build
  depends_on "libbpp-seq"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "#{r}-shared", "#{r}-static"
      system "make", "install"
    end
  end
end
