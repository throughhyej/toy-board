뷰의 라이프사이클 이론

# #
# beforeCreate
# ####
인스턴스의 내부 이벤트와 라이프 사이클 상태가 초기화 된 후 호출


# #
# created
# ####
인스턴스 주입과 반응형 시스템이 초기화 된 후 호출
해당 단계에서 인스턴스 기능을 수행하지만, DOM이 업데이트 되지 않아 
사용자는 UI에서 작동하는 것을 보지 못함


# #
# beforeMount
# ####
Vue.js가 템플릿 컴파일을 마치고 생성된 DOM을 렌더링할 준비가 된 후 호출


# #
# mounted
# ####
DOM이 업데이트 된 후 호출되며,
사용자가 UI를 통해 상호작용할 수 있고 인스턴스는 완전한 기능을 수행


# #
# beforeUpdate
# ####
데이터가 변경된 후 DOM이 업데이트 되기 전 호출됨
해당 훅에서 데이터 변경 수행이 가능하나 이 변경이 추가적인 DOM 업데이트를 하진 않음


# #
# updated
# ####
DOM이 데이터 변경 사항을 기반으로 업데이트 된 후에 호출


# #
# activated
# ####
keep-alive 컴포넌트가 활성화될 때 호출됨


# #
# deactivated
# ####
keep-alive 컴포넌트가 비활성화될 때 호출됨


# #
# beforeDestroy
# ####
인스턴스 파괴 전 호출되며,
해당 훅에서 인스턴스는 완전한 기능을 수행 후 destroy 됨


# #
# destroyed
# ####
인스턴스 파괴 후 호출되며, 해당 훅에서는 인스턴스의 모든 지시자의 바인딩이 해제됨
모든 이벤트 리스너도 제거되며 모든 하위 Vue 인스턴스가 파괴됨


# #
# errorCaptured
# ####
자손 컴포넌트에서 에러가 검출될 때마다 호출됨


# #
* <keep-alive></keep-alive> 컴포넌트
# #######
상태를 보존할 때나 재 렌더링을 피하기 위해 사용