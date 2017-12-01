#!/bin/bash
# script to create a react native project structure
# alias rnbootstrap='sh ~/scripts/reactNativeBootstrap.sh $*'
if [ $# -lt 1 ]; then
   echo "Passe o nome do seu projeto como parâmetro!"
   exit 1
fi
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
react-native init $1 &&
cd $1 &&
mkdir App &&  
mkdir App/components && 
mkdir App/config && 
mkdir App/screens && 
mkdir App/containers && 
mkdir App/utils && 
mkdir App/assets && 
mkdir App/assets/img &&
mv App.js App/App.js &&
mv $DIR/templates/index.js App/index.js
mv $DIR/templates/config/images.js App/config/images.js
mv $DIR/templates/config/colors.js App/config/colors.js
mv $DIR/templates/config/index.js App/config/index.js
mv $DIR/templates/components/index.js App/components/index.js
mv $DIR/templates/config/index.js App/config/index.js
mv $DIR/templates/containers/index.js App/containers/index.js
mv $DIR/templates/screens/index.js App/screens/index.js
mv $DIR/templates/utils/index.js App/utils/index.js

echo "Deseja instalar o redux [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add redux react-redux redux-logger 
  mkdir App/redux
  mv $DIR/templates/redux/index.js App/redux/index.js
  echo "Deseja instalar o reduxsauce [Y/n]?"
    read p
    p=${p:-"y"}
    if [ "$p" == "y" -o "$p" == "Y" ]; then
      yarn add reduxsauce seamless-immutable
    fi
fi

echo "Deseja instalar o moment [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add moment
fi

echo "Deseja instalar o lodash [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add lodash
fi

echo "Deseja instalar o React Navigation [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add react-navigation
  mv $DIR/templates/reouter.js App/reouter.js
fi

echo "Deseja instalar o React Native Firebase [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add react-native-firebase
  react-native link react-native-firebase
  echo "Para concluir a instalação siga as instruções em: https://rnfirebase.io/docs/v3.0.*/installation/initial-setup"
fi

echo "Deseja instalar o Realm [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add realm
  react-native link realm
fi

echo "Deseja instalar o React Native Vector Icons [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  yarn add react-native-vector-icons
  react-native link react-native-vector-icons
fi