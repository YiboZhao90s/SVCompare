# Clone the repository
git clone https://github.com/vcftools/vcftools.git

# Move into the right directory
cd vcftools

# Generate the configure script
./autogen.sh

# Configure the build (installing into your home directory)
./configure --prefix=$HOME/packages/vcftools

# Compile
make

# Install into your home directory (no sudo needed)
make install
