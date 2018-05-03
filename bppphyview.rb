class Bppsuite < Formula
  desc "The Bio++ Phylogenetic Viewer"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bppphyview/archive/v0.6.0.tar.gz"
  sha256 "9b1c5c0c193c9c68b6654bececbd9ee7ffde4af7c6b88f9adeac58f39d9465d4"
  
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
