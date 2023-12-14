#! /bin/bash
#SBATCH -c 16
#SBATCH --mem 48G
#SBATCH -t 6:00:00
#SBATCH -p grete:shared
#SBATCH -G A100:1
#SBATCH -A nim00007
#SBATCH --job-name=sam-iterative-prompting

source activate sam
python iterative_prompting.py --checkpoint /scratch/projects/nim00007/sam/from_carolin/vit_b/best.pt \
                              --experiment /scratch/usr/nimanwai/experiments/unetr/by_parts/finetuned/vit_b/freeze_encoder_False/distances/dicebaseddistloss/torch-em-sam/checkpoints/livecell-all/best.pt \
                              -m vit_b_train_with_finetuned_freeze_None --box