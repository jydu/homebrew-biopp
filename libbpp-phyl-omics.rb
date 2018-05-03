class LibbppPhylOmics < Formula
  desc "Bio++ Phylogenetics Library - Omics components"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-phyl-omics/archive/v2.4.0.tar.gz"
  sha256 "f4853b99bf0baacf96c9ba567a5875242283cba5fb6f066d74716c6f7d84bd34"

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
