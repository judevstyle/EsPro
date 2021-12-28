//
//  CustomerProfileViewModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 28/12/2564 BE.
//

import Foundation
import RxMoya
import RxSwift
import UIKit

protocol CustomerProfileProtocolInput {
    func setCustomerNo(customerNo: String)
    func getCustomerProfile()
    
//    func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

protocol CustomerProfileProtocolOutput: class {
    var didGetCustomerProfileSuccess: (() -> Void)? { get set }
    var didGetCustomerProfileError: (() -> Void)? { get set }
    
    func getDataCustomerProfile() -> GetCustomerProfileResponse?
    
//    func getNumberOfRowsInSection() -> Int
//    func getCellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    func getHeightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
}

protocol CustomerProfileProtocol: CustomerProfileProtocolInput, CustomerProfileProtocolOutput {
    var input: CustomerProfileProtocolInput { get }
    var output: CustomerProfileProtocolOutput { get }
}

class CustomerProfileViewModel: CustomerProfileProtocol, CustomerProfileProtocolOutput {
    
    var input: CustomerProfileProtocolInput { return self }
    var output: CustomerProfileProtocolOutput { return self }
    
    // MARK: - Properties
    private var getCustomerProfileUseCase: GetCustomerProfileUseCase
    private var vc: CustomerProfileViewController
    
    fileprivate let disposeBag = DisposeBag()
    
    public var listCustomerProfile: [GetCustomerProfileResponse] = []
    public var customerNo: String = ""
    
    init(
        getCustomerProfileUseCase: GetCustomerProfileUseCase = GetCustomerProfileUseCaseImpl(),
        vc: CustomerProfileViewController
    ) {
        self.getCustomerProfileUseCase = getCustomerProfileUseCase
        self.vc = vc
    }
    
    // MARK - Data-binding OutPut
    var didGetCustomerProfileSuccess: (() -> Void)?
    var didGetCustomerProfileError: (() -> Void)?
    
    func setCustomerNo(customerNo: String) {
        self.customerNo = customerNo
    }
    
    func getCustomerProfile() {
        vc.startLodingCircle()
        listCustomerProfile.removeAll()
        
        var request = GetCustomerProfileRequest()
        request.query = "Customer_Profile"
        request.custcode = self.customerNo
        
        getCustomerProfileUseCase
            .execute(request: request)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                debugPrint("Success : \(response)")
                weakSelf.vc.stopLoding()
                weakSelf.listCustomerProfile = response
                weakSelf.didGetCustomerProfileSuccess?()

            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                debugPrint("Error : \(error)")
                weakSelf.vc.stopLoding()
                weakSelf.didGetCustomerProfileError?()
            }).disposed(by: disposeBag)
    }
    
    func getDataCustomerProfile() -> GetCustomerProfileResponse? {
        return self.listCustomerProfile.first
    }

}

//OutPut TableView
extension CustomerProfileViewModel {
    
//    func getNumberOfRowsInSection() -> Int {
//        return self.listProductInfo.count
//    }
//
//    func getCellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.item == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoHeaderTableViewCell", for: indexPath) as! ProductInfoHeaderTableViewCell
//            cell.backgroundColor = UIColor.clear
//            cell.selectionStyle = .none
//            cell.setupUI()
//            return cell
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerProfileTableViewCell", for: indexPath) as! CustomerProfileTableViewCell
//            cell.backgroundColor = UIColor.clear
//            cell.selectionStyle = .none
//            cell.setupUI()
//            cell.item = self.listProductInfo[indexPath.item-1]
//            return cell
//        }
//    }
//
//    func getHeightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.item == 0 {
//            return 60
//        } else {
//            return 44
//        }
//    }
//
//    func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.item == 0 {
//        } else {
//            let item = listProductInfo[indexPath.item-1]
//            if let prod = item.ES_PN {
//                NavigationManager.instance.pushVC(to: .produceInfoDetail(prod: prod))
//            }
//        }
//    }
    
}
