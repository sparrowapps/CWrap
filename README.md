#  CWrap for swift framework

C언어를 Wrapping 하여 iOS / macOS 용 framework를 개발 해야 하는 경우가 있다.
swift 언어에서 C 언어와 상호 연동하기 위해서는 module.modulemap 파일을 구성 해야 한다.

이 예제는 간단하게 hello() 함수를 C로 작성 하고 이를 Wrapping 한 Swift class를 포함한 framework 프로젝트이다.
포함 하고 잇는 playground는 간단하게 호출을 테스트 해본다.

## Xcode new project framework

## c source, header 파일 작성

C source
'''
#include <stdio.h>

char * hello() {
  return "hello-world";
}
'''

header 파일
'''
#ifndef _LIB_H
#define _LIB_H

char * hello();

#endif
'''


## module.modulemap 파일 작성
'''

module CLib [system] {
    header "lib.h"
    export *
}
'''

## Wrap class 작성
'''
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
'''



