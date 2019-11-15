#!/bin/bash

TARGET_S3=s3://scealiontach/charts
KEY=${KEY:-kevin@blockchaintp.com}
KEY_RING=${KEY_RING:-~/.gnupg/trustdb.gpg}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

src_dir=${DIR}/..

pushd $src_dir

mkdir -p dist/local

for chart in `ls |grep -v "dist\|bin\|yaml"`; do
  set -x
  helm dep up $chart
  helm package -d $src_dir/dist/local ./$chart 
done

mkdir -p dist/repo
pushd $src_dir/dist/repo
aws s3 sync . s3://scealiontach/charts
cp $src_dir/dist/local/* .
helm repo index ./
aws s3 sync . s3://scealiontach/charts
popd

popd
