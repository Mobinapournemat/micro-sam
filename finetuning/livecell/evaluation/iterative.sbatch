#! /bin/bash
#SBATCH -c 16
#SBATCH --mem 48G
#SBATCH -t 6:00:00
#SBATCH -p grete:shared
#SBATCH -G A100:1
#SBATCH -A nim00007
#SBATCH --job-name=sam-iterative-prompting

source activate sam
sleep 10m
python iterative_prompting.py --checkpoint /scratch/usr/nimanwai/experiments/sam/disjoint_training/10k/checkpoints/livecell_sam/best.pt \
                              --experiment /scratch/usr/nimanwai/experiments/vnetr/10k/finetuned-10k/vit_b/freeze_encoder_False/distances/dicebaseddistloss/torch-em-scratch/checkpoints/livecell-all/best.pt \
                              -m vit_b_train_with_finetuned_10k_freeze_None --box