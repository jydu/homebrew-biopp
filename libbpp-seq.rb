class LibbppSeq < Formula
  desc "Bio++ Sequence Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-seq/archive/v2.4.0.tar.gz"
  sha256 "cfe8f82175aee11e94e250c3d22b01e96984b23f6040fd18f74b57375530853f"

  depends_on "cmake" => :build
  depends_on "libbpp-core"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"bpp-test.cpp").write <<-EOS.undent
#include <Bpp/Seq/Alphabet/DNA.h>
#include <Bpp/Seq/Alphabet/RNA.h>
#include <Bpp/Seq/Alphabet/ProteicAlphabet.h>
#include <Bpp/Seq/Alphabet/DefaultAlphabet.h>
#include <Bpp/Seq/Alphabet/CodonAlphabet.h>
#include <Bpp/Seq/Alphabet/AlphabetTools.h>
#include <iostream>

using namespace bpp;
using namespace std;

int main() {
  //This is a very simple test that instanciate all alpahabet classes.
  NucleicAlphabet* dna = new DNA();
  NucleicAlphabet* rna = new RNA();
  Alphabet* pro = new ProteicAlphabet;
  Alphabet* def = new DefaultAlphabet;
  Alphabet* cdn = new CodonAlphabet(rna);

  //Testing functions:
  if (!AlphabetTools::isDNAAlphabet(dna)) return 1;
  if (!AlphabetTools::isRNAAlphabet(rna)) return 1;
  if (!AlphabetTools::isNucleicAlphabet(dna)) return 1;
  if (!AlphabetTools::isNucleicAlphabet(rna)) return 1;
  if (!AlphabetTools::isProteicAlphabet(pro)) return 1;
  if (!AlphabetTools::isCodonAlphabet(cdn)) return 1;

  delete dna;
  delete rna;
  delete pro;
  delete def;
  delete cdn;

  return (0);
}
EOS
    libs = %w[-lbpp-core -lbpp-seq]
    system ENV.cxx, "-o", "test", "bpp-test.cpp",
           "-I#{include}", "-L#{lib}", *libs
    system "./test"
  end
end
