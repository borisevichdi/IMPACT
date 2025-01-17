pop=EAS
for file in {1..728}
do
annot=IMPACT_ENCODE_${file}
nnot_dir=/path/to/annots/
quantiles=20
cmd="perl /path/to/ldsc/quantile_M.pl --ref-annot-chr /path/to/ldsc/customized_baselineLD_cts_EAS.,$annot_dir/$annot. --frqfile-chr /path/to/ldsc/1000G_EAS_Phase3_frq/1000G.EAS.QC. --annot-header Chromatin --nb-quantile $quantiles --maf 0.05 --out custBLcts.$file.q$quantiles.EAS.newM"
bsub -q big -R 'rusage[mem=15000]' -W 10:00 -o $annot.log "$cmd"
done

