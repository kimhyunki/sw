



#sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file 
/lib/modules/$(uname -r)/build/scripts/sign-file sha256 priv.key pubkey.der ./simple.ko


#openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=simple module/"
#sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der 


exit

 make
  sudo make install
  (최신 커널에 대한 블로그 게시물에없는 추가 단계는 대부분이 단계를 건너 뛸 수 있습니다) :을 사용하여 컴파일 된 파일의 형식을 확인하십시오 modinfo -n veikk. 이 .ko.xz아닌로 끝나는 경우 .ko먼저 파일의 압축을 풀고 다시로드해야 modules.dep합니다. 로 끝나는 .ko경우이 단계를 건너 뛰십시오.

   # only if it ends in .ko.xz
    sudo xz --decompress $(modinfo -n veikk)
     sudo depmod
     등록 된 키로 파일에 서명하십시오.

      /lib/modules/$(uname -r)/scripts/sign-file sha256 priv.key pubkey.der $(modinfo -n veikk)
      모듈을 장착하십시오. 성공하면 오류가 발생하지 않습니다.

       sudo modprobe veikk


