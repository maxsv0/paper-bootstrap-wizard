#!/bin/bash
set -e

#
# Module publishing tool for MSV Repository
#
repositoryurl=http://rep.msvhost.com/api/import/
modulename=paper-bootstrap-wizard
repositorykey=$1
configinstall=src/module/$modulename/config.install.xml
previewfile=src/content/images/module_preview/$modulename.jpg

if [ -z "$modulename" ]
  then
    echo "[ERROR] Missing Module name"
	exit 1
fi

mkdir src-temp
cp -a src/. src-temp
find src-temp/ -name .DS_Store -delete

echo "Creating $modulename.zip.."
cd src-temp
zip -r ../$modulename.zip .
cd ..

echo "Removing temp files.."
rm -R src-temp
echo "Done! $modulename.zip created successfully"

echo "=============================================="
echo "Publish archive to MSV repository: $repositoryurl"

if [ -z "$repositorykey" ]
  then
    echo "[ERROR] Missing repository KEY"
	exit 1
fi

if [ ! -f $configinstall ]
  then
    echo "[ERROR] Missing installation config file: $configinstall"
	exit 1
fi

if [ ! -f $previewfile ];
	then
      echo "[ERROR] Preview file $previewfile was not found"
	  exit 1
fi

echo "========> Module: $modulename (key :  $repositorykey)"
echo "Sending file to repository.."
response=$(curl -F "file=@$modulename.zip" -F "preview=@$previewfile" -F "config=@$configinstall" -F "module=$modulename" -F "key=$repositorykey" $repositoryurl)
echo $response

if [[ $response = *"[ERROR]"* ]]; then
    echo "[ERROR] has occurred"
    exit 1
fi

echo "[SUCCESS] upload successfully!"
exit 0