#!/bin/bash

TARGET_S3=s3://btp-charts-stable/charts
KEY=${KEY:-admin@blockchaintp.com}
KEY_RING=${KEY_RING:-~/.gnupg/secring.gpg}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

src_dir=${DIR}/..

pushd $src_dir/charts

mkdir -p dist/local

for chart in `ls |grep -v "dist\|bin\|yaml"`; do
  set -x
  helm dep up $chart
  helm package -d $src_dir/dist/local ./$chart 
done

mkdir -p dist/repo
pushd $src_dir/dist/repo
aws s3 sync . $TARGET_S3
cp $src_dir/dist/local/* .
helm repo index ./
aws s3 sync . $TARGET_S3
popd

popd
