#!/usr/bin/env bash

rye run python run_model.py --gpu_ids 0 --model GCNet_model --GCNet_name GCNet --GCNet_checkp data/models_ECCV2020/GCNet.pth --benchmark ups_DiLiGenT_dataset --bm_dir data/datasets/DiLiGenT/pmsData_crop
rye run python run_model.py --gpu_ids 0 --model GCNet_N_model --GCNet_name GCNet --GCNet_checkp data/models_ECCV2020/GCNet.pth --Normal_Net_name PS_FCN --Normal_Net_checkp data/models_ECCV2020/PS-FCN_B_S_32.pth --benchmark ups_DiLiGenT_dataset --bm_dir data/datasets/DiLiGenT/pmsData_crop