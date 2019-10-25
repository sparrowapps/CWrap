#  CWrap for swift framework

C언어를 Wrapping 하여 iOS / macOS 용 framework를 개발 해야 하는 경우가 있다.

swift 언어에서 C 언어와 상호 연동하기 위해서는 module.modulemap 파일을 구성 해야 한다.

이 예제는 간단하게 hello() 함수를 C로 작성 하고 이를 Wrapping 한 Swift class를 포함한 framework 프로젝트이다.

포함 하고 잇는 playground는 간단하게 호출을 테스트 해본다.


## Xcode new project framework
file -> new -> project -> iOS |  Framework

## c source, header 파일 작성

C source
```
#include <stdio.h>

char * hello() {
  return "hello-world";
}
```

header 파일
```
#ifndef _LIB_H
#define _LIB_H

char * hello();

#endif
```


## module.modulemap 파일 작성
xcode empty 파일로 선택을 하고 module.modulemap으로 저장 한다.  C / header 파일이 위치한곳에 파일을 생성한다.

```
module CLib [system] {
    header "lib.h"
    export *
}
```

module 다음에 이름은 import에서 사용 하는 모듈 이름이 된다.

## Wrap class 작성
```
import Foundation
import CLib

public class CWrap {
    
    public init() {
        
    }
    
    public func hello() -> String {
        let text = CLib.hello()
        return String(cString: text!)
    }
}
```

## Wrap class 작성시 modulemap 에서 선언한 모듈이름을 찾지 못하는 경우
프로젝트 설정에서

Build Settings

Import 로 검색을 한다.

Swift Compiler - Search Paths

Import Paths 항목에 $(SRCROOT)/CWrap/clib 을 입력 하여 C 소스를 찾을 수 있도록 설정 한다.

## playground 를 이용한 테스트
프로젝트 네비게이션에서 새 그룹을 생성 하고

new file -> playground blank 를 추가 한다.




