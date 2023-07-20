// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract HotelRoom {
    //1. 호텔 룸에 대한 정보
    //2. 호텔 가격 지불에 대한 정보
    //3. guest, host address
    //호텔룸 주인에 대한 정보(이더를 수신해야 함)
    address payable public owner;
    //호텔 방 예약 여부에 대한 정보
    //1 상태변수 정의
    enum Statuses{Vacant, Occupied}
    Statuses currentStatus;
    event Occupy(address _occupant, uint _value); //이밴트 정으ㅡ
    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }
    modifier costs(uint _amount){
        //1. 가격체크
        require(msg.value >= 2 ether, "Not Enough Provided");
        _;
    }
    modifier onlyWhileVacant{
        //2. 빈방여부 체크
        require(currentStatus == Statuses.Vacant, "Currently Occupied!");
        _;
    }
    //calldata 없이 msg를 받을떄 동작하는 함수

    receive() external payable costs(2 ether) onlyWhileVacant{
        currentStatus = Statuses.Occupied; //방 예약 완료
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}
