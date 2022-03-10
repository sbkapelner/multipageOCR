#/bin/bash
echo "Checking prerequisites..."; sleep .5
Install(){
    which brew 1>/dev/null
    if [ $? -ne 0 ]; then
        echo "Install Homebrew or install required packages manually" && exit 0
    else
        while true; do
        read -p "$1 not installed. Do you wish to install this program? y/n " yn
        case $yn in
            [Yy]* ) brew install $1; break;;
            [Nn]* ) echo "Install $1 before continuing.."; sleep .5 && exit 0;;
            * ) echo "Please answer yes or no.";;
        esac
    done
    fi
}

which magick 1>/dev/null
if [ $? -eq 0 ]; then
    echo "ImageMagick already installed"; sleep .5
    else
        Install imagemagick
fi

which tesseract 1>/dev/null
if [ $? -eq 0 ]; then
    echo "Tesseract already installed"; sleep .5
    else
        Install tesseract
fi

CheckLangs() {
    touch test.png
    tesseract test.png stdout 2>/dev/null -l spa
    rm -rf test.png
    }
    
CheckLangs

if [ $? -eq 0 ]; then
    echo "Tesseract Languages already installed"; sleep .5
    else
        Install tesseract-lang
fi