class LibbppPhyl < Formula
  desc "Bio++ Phylogenetics Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-phyl/archive/v2.3.1.tar.gz"
  sha256 "4bcf15ae8e096faffaa97eb04c830dddc8a22fcdcb222fe4ea6f2b3775b3a0dc"

  depends_on "cmake" => :build
  depends_on "libbpp-seq"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"bpp-test.cpp").write <<-EOS.undent
#include <Bpp/Numeric/Prob/GammaDiscreteDistribution.h>
#include <Bpp/Numeric/Matrix/MatrixTools.h>
#include <Bpp/Seq/Alphabet/AlphabetTools.h>
#include <Bpp/Phyl/TreeTemplate.h>
#include <Bpp/Phyl/Model/Nucleotide/T92.h>
#include <Bpp/Phyl/Model/RateDistribution/GammaDiscreteRateDistribution.h>
#include <Bpp/Phyl/Simulation/HomogeneousSequenceSimulator.h>
#include <Bpp/Phyl/Likelihood/RHomogeneousTreeLikelihood.h>
#include <Bpp/Phyl/OptimizationTools.h>
#include <iostream>

using namespace bpp;
using namespace std;

void fitModelHSR(SubstitutionModel* model, DiscreteDistribution* rdist, const Tree& tree, const SiteContainer& sites,
    double initialValue, double finalValue) {
  RHomogeneousTreeLikelihood tl(tree, sites, model, rdist);
  tl.initialize();
  ApplicationTools::displayResult("Test model", model->getName());
  cout << setprecision(20) << tl.getValue() << endl;
  ApplicationTools::displayResult("* initial likelihood", tl.getValue());
  if (abs(tl.getValue() - initialValue) > 0.001)
    throw Exception("Incorrect initial value.");
  OptimizationTools::optimizeTreeScale(&tl);
  ApplicationTools::displayResult("* likelihood after tree scale", tl.getValue());
  OptimizationTools::optimizeNumericalParameters2(&tl, tl.getParameters(), 0, 0.000001, 10000, 0, 0);
  cout << setprecision(20) << tl.getValue() << endl;
  ApplicationTools::displayResult("* likelihood after full optimization", tl.getValue());
  if (abs(tl.getValue() - finalValue) > 0.001)
    throw Exception("Incorrect final value.");
}

void fitModelHDR(SubstitutionModel* model, DiscreteDistribution* rdist, const Tree& tree, const SiteContainer& sites,
    double initialValue, double finalValue) {
  DRHomogeneousTreeLikelihood tl(tree, sites, model, rdist);
  tl.initialize();
  ApplicationTools::displayResult("Test model", model->getName());
  cout << setprecision(20) << tl.getValue() << endl;
  ApplicationTools::displayResult("* initial likelihood", tl.getValue());
  if (abs(tl.getValue() - initialValue) > 0.001)
    throw Exception("Incorrect initial value.");
  OptimizationTools::optimizeTreeScale(&tl);
  ApplicationTools::displayResult("* likelihood after tree scale", tl.getValue());
  OptimizationTools::optimizeNumericalParameters2(&tl, tl.getParameters(), 0, 0.000001, 10000, 0, 0);
  cout << setprecision(20) << tl.getValue() << endl;
  ApplicationTools::displayResult("* likelihood after full optimization", tl.getValue());
  if (abs(tl.getValue() - finalValue) > 0.001)
    throw Exception("Incorrect final value.");
}

int main() {
  unique_ptr<TreeTemplate<Node> > tree(TreeTemplateTools::parenthesisToTree("((A:0.01, B:0.02):0.03,C:0.01,D:0.1);"));
  vector<string> seqNames= tree->getLeavesNames();
  vector<int> ids = tree->getNodesId();
  //-------------

  const NucleicAlphabet* alphabet = &AlphabetTools::DNA_ALPHABET;

  VectorSiteContainer sites(alphabet);
  sites.addSequence(BasicSequence("A", "AAATGGCTGTGCACGTC", alphabet));
  sites.addSequence(BasicSequence("B", "GACTGGATCTGCACGTC", alphabet));
  sites.addSequence(BasicSequence("C", "CTCTGGATGTGCACGTG", alphabet));
  sites.addSequence(BasicSequence("D", "AAATGGCGGTGCGCCTA", alphabet));

  unique_ptr<SubstitutionModel> model(new T92(alphabet, 3.));
  unique_ptr<DiscreteDistribution> rdist(new GammaDiscreteRateDistribution(4, 1.0));
  try {
    cout << "Testing Single Tree Traversal likelihood class..." << endl;
    fitModelHSR(model.get(), rdist.get(), *tree, sites, 85.030942031997312824, 65.72293577214308868406);
  } catch (Exception& ex) {
    cerr << ex.what() << endl;
    return 1;
  }  

  model.reset(new T92(alphabet, 3.));
  rdist.reset(new GammaDiscreteRateDistribution(4, 1.0));
  try {
    cout << "Testing Double Tree Traversal likelihood class..." << endl;
    fitModelHDR(model.get(), rdist.get(), *tree, sites, 85.030942031997312824, 65.72293577214308868406);
  } catch (Exception& ex) {
    cerr << ex.what() << endl;
    return 1;
  }  

  //Let's compare the derivatives:
  RHomogeneousTreeLikelihood tlsr(*tree, sites, model.get(), rdist.get());
  tlsr.initialize();
  DRHomogeneousTreeLikelihood tldr(*tree, sites, model.get(), rdist.get());
  tldr.initialize();
  vector<string> params = tlsr.getBranchLengthsParameters().getParameterNames();
  for (vector<string>::iterator it = params.begin(); it != params.end(); ++it) {
    double d1sr = tlsr.getFirstOrderDerivative(*it);
    double d1dr = tldr.getFirstOrderDerivative(*it);
    cout << *it << "\t" << d1sr << "\t" << d1dr << endl;
    if (abs(d1sr - d1dr) > 0.000001) return 1;
  }

  return 0;
}
EOS
    libs = %w[-lbpp-core -lbpp-seq -lbpp-phyl]
    system ENV.cxx, "-o", "test", "bpp-test.cpp",
           "-I#{include}", "-L#{lib}", *libs
    system "./test"
  end
end
