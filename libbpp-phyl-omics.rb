class LibbppPhylOmics < Formula
  desc "Bio++ Phylogenetics Library - Omics components"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-phyl-omics/archive/v2.4.1.tar.gz"
  sha256 "56cc0da613e72dbb8d0ed10d8209e182804a850fd96df1481e4710df97f18435"

  depends_on "cmake" => :build
  depends_on "libbpp-seq-omics"
  depends_on "libbpp-phyl"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
