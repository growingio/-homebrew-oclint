# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OclintGrowing < Formula
  desc "oclint version 0.15 support , growing rule add"
  homepage "http://oclint.org"
  url "https://github.com/growingio/oclint-growing/releases/download/v1.0/oclint-growing.zip"
  sha256 "790c1a3fde21fc19408f024a741a70e2267edb2449d6b78a44aa713d0c55a819"
  license ""

  # depends_on "cmake" => :build

  def install
    clang_version = '10.0.0'

    include.install Dir['include/c++'] unless File.directory? "#{include}/c++"
    "#{include}/c++".install Dir['include/c++/v1'] unless File.directory? "#{include}/c++/v1"
    lib.install Dir['lib/clang'] unless File.directory? "#{lib}/clang"
    "#{lib}/clang".install Dir['lib/clang/#{clang_version}'] unless File.directory? "#{lib}/clang/#{clang_version}"
    lib.install Dir['lib/oclint']
    bin.install Dir['bin/*']

  end

end
