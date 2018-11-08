class Bppphyview < Formula
  desc "The Bio++ Phylogenetic Viewer"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bppphyview/archive/v0.6.1.tar.gz"
  sha256 "dfa4a26590e5cc6e71c69224d4d0659d47efb0b0388411256d773fcfab229f16"
  
  depends_on "cmake" => :build
  depends_on "libbpp-qt"
 
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "phyview"
  end
end
