// SPDX-License-Identifier: GPL 3.0

pragma solidity ^0.8.13;
contract Example{
// 열거형(enum)
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    Status public status;
    //status 정보를 return
    function get() public view returns(Status){
        return status;
    }
    //Status 업데이트
    function set(Status _status) public {
        status = _status;
    }
    //사용 예
    function cancel() public {
        status = Status.Canceled;
    }
    //Status의 상태 0으로 초기화
    function reset() public {
        delete status;
    }
}
