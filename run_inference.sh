#!/bin/bash

# EDiffSR Inference Helper Script

# Ensure we are in the root directory of the project
cd "$(dirname "$0")"

# Check if inputs directory has images
if [ -z "$(ls -A inputs)" ]; then
   echo "Error: 'inputs' directory is empty. Please place your satellite images in the 'inputs' folder."
   exit 1
fi

# Create results directory if it doesn't exist
mkdir -p results

# Run the inference
echo "Starting inference..."
# export CUDA_VISIBLE_DEVICES="-1"
cd codes/config/sisr
python test.py -opt options/test/custom_test.yml

echo "Inference complete! Check the 'results' folder for your high-resolution images."
