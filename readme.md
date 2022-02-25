### Configurando Ambiente

- Baixar Dark SDK
- Instalar o FVM
- Instalar Flutter do Desenvolvimento do Aplicativo
- Instalar Android Studio
- Instalar Plugins do Android Studio (Flutter e Dart)
- Adicionar Licenses flutter doctor --android-licenses
- Verificar rodando flutter doctor -v

### Instalando FVM

- Execute os passos a seguir, caso de dúvidas ler este artigo [link](https://blog.flutterando.com.br/%C3%A9-do-brasil-fvm-uma-forma-simples-de-gerenciar-as-vers%C3%B5es-do-flutter-6e0999ce8ad9)

      dart pub global activate fvm
      fvm releases      
      fvm install 2.10.1
      fvm global 2.10.1


### Comandos Básicos de Desenvolvimento

- Verificar Ambiente Flutter

      flutter doctor -v

- Baixar Dependências do Projeto

      flutter pub get

- Verificar Dispositivos Conectados

      flutter devices

- Desativar Development Web

      flutter config --no-enable-web

- Alternativa a Flutter Run Para Debug

      flutter attach

- Executando Aplicativo Flutter

      flutter run -v
      flutter run -d ca57650f
      flutter run -d ca57650f --hot

- Procurar Bins Necessários

      whereis nome_do_comando_procurado

### Comandos de Apk

- Gerando KeyStore Assinada para Releases (nguuk0BaT9MY)

      keytool -genkey -v -keystore %USERPROFILE%\.android\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
      keytool -importkeystore -srckeystore %USERPROFILE%\.android\upload-keystore.jks -destkeystore %USERPROFILE%\.android\upload-keystore.jks -deststoretype pkcs12

- Leia o artigo para entender as alterações de código necessárias para  configurar a geração da release [link](https://docs.flutter.dev/deployment/android)

- Limpe o cache 

      flutter clean

- Gerando Build em Formato Appbundle

      flutter build appbundle

- Verificar assinatura do Apk* [link](https://www.desenv-web-rp-bd.com/pt/android/jarsigner-nao-e-reconhecido-comando-interno-ou-externo/1055281942/)

      jarsigner -verify -verbose -certs app-release.aab

- Listar SHA1 Release

      project\android\gradlew.bat signingReport

### Gerando os Icones

- Gerando os Novos Icones de Acordo com Image Base no Pubspec

      flutter pub run flutter_launcher_icons:main
