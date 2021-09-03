echo -e "\033[32m ^_^ Strucutre your new flutter project with Getx and other packages"

#  get current directory
CURRENT_DIR=$(pwd)
# add pacakge name
PACKAGE_NAME="flutter-file-structure/"
# get package directory
PACKAGE_PATH="$CURRENT_DIR/$PACKAGE_NAME"
# sh file name
SH_FILE_NAME="install-flutter-file-structure.sh"
# sh file path
SH_FILE_PATH="$PACKAGE_PATH/$SH_FILE_NAME"

# check if package directory exists
if [ -d "$CURRENT_DIR/$PACKAGE_NAME" ]; then
  ### Take action if $DIR exists ###
  echo "remove old package ${DIR}..."
Yes |  rm -R "$CURRENT_DIR/$PACKAGE_NAME"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "clone new package"
fi
git clone https://github.com/HROKA/flutter-file-structure.git

Yes | rm -R "$PACKAGE_PATH/.git"

cp -R "$PACKAGE_PATH/." "$CURRENT_DIR/"

Yes | rm -R "$PACKAGE_PATH"

if [ -d "$SH_FILE_PATH" ]; then
  ### Take action if $DIR exists ###
  echo "remove shell file ${DIR}..."
Yes | rm "$SH_FILE_PATH"
  echo "remove package readme file ${DIR}..."
Yes | rm "$PACKAGE_PATH/README.md"
fi

echo -e "\033[36m ###--- install flutter packages ---###"
echo -e "\033[36m ###--- Every thing done sucssesfully ---###"
echo -e "\033[32m ^_^ "

# Text Colors
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37