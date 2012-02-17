#!/usr/bin/env bash

#Installing pipelines.
#Samtools first to build for breakdancer.
if [ ! -f "extern/samtools-0.1.6/samtools" ]; then
  pushd extern/samtools-0.1.6/; make; popd
else
  echo "Samtools already compiled."
fi

#Breakdancer.
if [ -z $(which breakdancer_max) ]; then
  pushd extern/breakdancer/cpp/;make; popd
else
  echo "Breakdancer already installed"
fi
#Breakdancer dependencies.
#Statistics::Descriptive
if [ ! -f "~/local/lib/perl5/Statistics/Descriptive.pm" ]; then
  pushd extern/Statistics-Descriptive-2.6/
  perl Makefile.PL INSTALL_BASE=~/local
  make install
  popd
else
  echo "Perl module Statistics::Descriptive already installed."
fi


./setup.py install --user
./setup.py install --home ~/local
rm -r build
