//
//  ProductInfoViewModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 19/12/2564 BE.
//

import Foundation
import RxMoya
import RxSwift
import UIKit

protocol ProductInfoProtocolInput {
    func fetchData()
    func setProdId(prod: String)
    
//    func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

protocol ProductInfoProtocolOutput: class {
    var didGetProductInfo2Success: (() -> Void)? { get set }
    var didGetProductInfo2Error: (() -> Void)? { get set }
    
    var didGetProductInfo3Success: (() -> Void)? { get set }
    var didGetProductInfo3Error: (() -> Void)? { get set }
    
    var didGetSimilarPartSuccess: (() -> Void)? { get set }
    var didGetSimilarPartError: (() -> Void)? { get set }
    
    var didGetRelatedPartSuccess: (() -> Void)? { get set }
    var didGetRelatedPartError: (() -> Void)? { get set }
    
    func getDataProductInfo2() -> GetProductDetailInfo2Response?
    func getDataProductInfo3() -> [GetProductDetailInfo3Response]
    func getDataSimilarPart() -> [GetSimilarRelatedPartResponse]
    func getDataRelatedPart() -> [GetSimilarRelatedPartResponse]
    
    func getDataTablePrice() -> [PriceTableModel]
    func getDataInventoryTable() -> [InventoryTableModel]
    func getDataInventoryFooter() -> (Double, Double, Double)
    
    //Auto Feed
//    func getNumberOfRowsInSection(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    func getCellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    func getHeightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
}

protocol ProductInfoProtocol: ProductInfoProtocolInput, ProductInfoProtocolOutput {
    var input: ProductInfoProtocolInput { get }
    var output: ProductInfoProtocolOutput { get }
}

class ProductInfoViewModel: ProductInfoProtocol, ProductInfoProtocolOutput {
    
    var input: ProductInfoProtocolInput { return self }
    var output: ProductInfoProtocolOutput { return self }
    
    // MARK: - Properties
    private var getProductDetailInfo2UseCase: GetProductDetailInfo2UseCase
    private var getProductDetailInfo3UseCase: GetProductDetailInfo3UseCase
    private var getSimilarRelatedPartUseCase: GetSimilarRelatedPartUseCase
    private var vc: ProductInfoViewController
    
    fileprivate let disposeBag = DisposeBag()
    
    //For Table Price
    var listPriceTable: [PriceTableModel] = []
    //For Table Inventory
    var listInventoryTable: [InventoryTableModel] = []
    
    init(
        getProductDetailInfo2UseCase: GetProductDetailInfo2UseCase = GetProductDetailInfo2UseCaseImpl(),
        getProductDetailInfo3UseCase: GetProductDetailInfo3UseCase = GetProductDetailInfo3UseCaseImpl(),
        getSimilarRelatedPartUseCase: GetSimilarRelatedPartUseCase = GetSimilarRelatedPartUseCaseImpl(),
        vc: ProductInfoViewController
    ) {
        self.getProductDetailInfo2UseCase = getProductDetailInfo2UseCase
        self.getProductDetailInfo3UseCase = getProductDetailInfo3UseCase
        self.getSimilarRelatedPartUseCase = getSimilarRelatedPartUseCase
        self.vc = vc
    }
    
    // MARK - Data-binding OutPut
    var didGetProductInfo2Success: (() -> Void)?
    var didGetProductInfo2Error: (() -> Void)?
    
    var didGetProductInfo3Success: (() -> Void)?
    var didGetProductInfo3Error: (() -> Void)?
    
    var didGetSimilarPartSuccess: (() -> Void)?
    var didGetSimilarPartError: (() -> Void)?
    
    var didGetRelatedPartSuccess: (() -> Void)?
    var didGetRelatedPartError: (() -> Void)?
    
    private var dataProductInfo2: GetProductDetailInfo2Response?
    private var dataProductInfo3: [GetProductDetailInfo3Response] = []
    private var dataSimilarPart: [GetSimilarRelatedPartResponse] = []
    private var dataRelatedPart: [GetSimilarRelatedPartResponse] = []
    
    private var prodId: String?
    
    func setProdId(prod: String) {
        prodId = prod
    }
    
    func fetchData() {
        self.getProductInfo2()
    }
    
    func getProductInfo2() {
        //Fetch Data
        var request = GetProductDetailInfoRequest()
        request.query = "Product_info2"
        request.prod = prodId
        request.mfrprod = "s"
        
        vc.startLodingCircle()
        getProductDetailInfo2UseCase
            .execute(request: request)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                debugPrint("Success : \(response)")
                weakSelf.vc.stopLoding()
                weakSelf.dataProductInfo2 = response.first
                weakSelf.fetchDataTablePrice()
                weakSelf.fetchDataInventoryTable()
                weakSelf.didGetProductInfo2Success?()
                
                
                weakSelf.getProductInfo3()

            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                debugPrint("Error : \(error)")
                weakSelf.vc.stopLoding()
                weakSelf.didGetProductInfo2Error?()
            }).disposed(by: disposeBag)
    }
    
    func getProductInfo3() {
        //Fetch Data
        var request = GetProductDetailInfoRequest()
        request.query = "Product_info3"
        request.prod = prodId
        request.mfrprod = "s"
        
        vc.startLodingCircle()
        getProductDetailInfo3UseCase
            .execute(request: request)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                debugPrint("Success : \(response)")
                weakSelf.vc.stopLoding()
                weakSelf.dataProductInfo3 = response
                weakSelf.didGetProductInfo3Success?()
                
                weakSelf.getSimilarPart()

            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                debugPrint("Error : \(error)")
                weakSelf.vc.stopLoding()
                weakSelf.didGetProductInfo3Error?()
            }).disposed(by: disposeBag)
    }
    
    func getSimilarPart() {
        var request = GetProductDetailInfoRequest()
        request.query = "Product_info4"
        request.prod = prodId
        request.prod = "000704025"
        request.mfrprod = "s"
        vc.startLodingCircle()
        getSimilarRelatedPartUseCase
            .execute(request: request)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                debugPrint("Success : \(response)")
                weakSelf.vc.stopLoding()
                weakSelf.dataSimilarPart = response
                weakSelf.didGetSimilarPartSuccess?()
                
                weakSelf.getRelatedPart()

            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                debugPrint("Error : \(error)")
                weakSelf.vc.stopLoding()
                weakSelf.didGetSimilarPartError?()
            }).disposed(by: disposeBag)
    }
    func getRelatedPart() {
        var request = GetProductDetailInfoRequest()
        request.query = "Product_info5"
        request.prod = prodId
        request.prod = "000503604"
        request.mfrprod = "s"
        vc.startLodingCircle()
        getSimilarRelatedPartUseCase
            .execute(request: request)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                debugPrint("Success : \(response)")
                weakSelf.vc.stopLoding()
                weakSelf.dataRelatedPart = response
                
                weakSelf.didGetRelatedPartSuccess?()

            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                debugPrint("Error : \(error)")
                weakSelf.vc.stopLoding()
                weakSelf.didGetRelatedPartError?()
            }).disposed(by: disposeBag)
    }

}

//OutPut
extension ProductInfoViewModel {
    func getDataProductInfo2() -> GetProductDetailInfo2Response? {
        return dataProductInfo2
    }
    
    func getDataProductInfo3() -> [GetProductDetailInfo3Response] {
        return dataProductInfo3
    }
    
    func getDataSimilarPart() -> [GetSimilarRelatedPartResponse] {
        return dataSimilarPart
    }
    
    func getDataRelatedPart() -> [GetSimilarRelatedPartResponse] {
        return dataRelatedPart
    }

}

// MARK: For PriceTableView
extension ProductInfoViewModel {
    public func getDataTablePrice() -> [PriceTableModel] {
        return self.listPriceTable
    }
    
    private func fetchDataTablePrice() {
        guard let item = self.getDataProductInfo2() else { return }
        //For Price TableVirw
        listPriceTable.removeAll()
        if let price1 = item.PRICE1, price1 != 0 {
            listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE1 ?? 0, unitPrice: price1))
            if let price2 = item.PRICE2, price2 != 0 {
                listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE2 ?? 0, unitPrice: price2))
                if let price3 = item.PRICE3, price3 != 0 {
                    listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE3 ?? 0, unitPrice: price3))
                    if let price4 = item.PRICE4, price4 != 0 {
                        listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE4 ?? 0, unitPrice: price4))
                        if let price5 = item.PRICE5, price5 != 0 {
                            listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE5 ?? 0, unitPrice: price5))
                            if let price6 = item.PRICE6, price6 != 0 {
                                listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE6 ?? 0, unitPrice: price6))
                                if let price7 = item.PRICE7, price7 != 0 {
                                    listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE7 ?? 0, unitPrice: price7))
                                    if let price8 = item.PRICE8, price8 != 0 {
                                        listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE8 ?? 0, unitPrice: price8))
                                        if let price9 = item.PRICE9, price9 != 0 {
                                            listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE9 ?? 0, unitPrice: price9))
                                            if let price10 = item.PRICE10, price10 != 0 {
                                                listPriceTable.append(PriceTableModel(qyt: item.PRODUCTPRICE10 ?? 0, unitPrice: price10))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension ProductInfoViewModel {
    private func fetchDataInventoryTable() {
        guard let item = self.getDataProductInfo2() else { return }
        //listInventoryTable
        listInventoryTable.removeAll()
        let balanceA: Double = (item.QTYA_ONHAND ?? 0) + (item.A_BOOKING ?? 0)
        let balanceB: Double = (item.QTYB_ONHAND ?? 0) + (item.B_BOOKING ?? 0)
        let balanceC: Double = (item.QTYC_ONHAND ?? 0) + (item.C_BOOKING ?? 0)
        let balanceD: Double = (item.QTYD_ONHAND ?? 0) + (item.D_BOOKING ?? 0)
        let balanceE: Double = (item.QTYE_ONHAND ?? 0) + (item.E_BOOKING ?? 0)
        let balanceF: Double = (item.QTYF_ONHAND ?? 0) + (item.F_BOOKING ?? 0)
        let balanceG: Double = (item.QTYG_ONHAND ?? 0) + (item.G_BOOKING ?? 0)
        let balanceI: Double = (item.QTYI_ONHAND ?? 0) + (item.I_BOOKING ?? 0)
        let balanceJ: Double = (item.QTYJ_ONHAND ?? 0) + (item.J_BOOKING ?? 0)
        let balanceK: Double = (item.QTYK_ONHAND ?? 0) + (item.K_BOOKING ?? 0)
        let balanceL: Double = (item.QTYL_ONHAND ?? 0) + (item.L_BOOKING ?? 0)
        let balanceM: Double = (item.QTYM_ONHAND ?? 0) + (item.M_BOOKING ?? 0)
        let balanceN: Double = (item.QTYN_ONHAND ?? 0) + (item.N_BOOKING ?? 0)
        
        setItemInventoryTable("A", "RET.SHOP-BANMOH", item.QTYA_ONHAND, item.A_BOOKING, balance: balanceA)
        setItemInventoryTable("B", "", item.QTYB_ONHAND, item.B_BOOKING, balance: balanceB)
        setItemInventoryTable("C", "", item.QTYC_ONHAND, item.C_BOOKING, balance: balanceC)
        setItemInventoryTable("D", "", item.QTYD_ONHAND, item.D_BOOKING, balance: balanceD)
        setItemInventoryTable("E", "", item.QTYE_ONHAND, item.E_BOOKING, balance: balanceE)
        setItemInventoryTable("F", "", item.QTYF_ONHAND, item.F_BOOKING, balance: balanceF)
        setItemInventoryTable("G", "", item.QTYG_ONHAND, item.G_BOOKING, balance: balanceG)
        setItemInventoryTable("I", "", item.QTYI_ONHAND, item.I_BOOKING, balance: balanceI)
        setItemInventoryTable("J", "", item.QTYJ_ONHAND, item.J_BOOKING, balance: balanceJ)
        setItemInventoryTable("K", "", item.QTYK_ONHAND, item.K_BOOKING, balance: balanceK)
        setItemInventoryTable("L", "WH-B.HARMONY", item.QTYL_ONHAND, item.L_BOOKING, balance: balanceL)
        setItemInventoryTable("M", "", item.QTYM_ONHAND, item.M_BOOKING, balance: balanceN)
        setItemInventoryTable("N", "", item.QTYN_ONHAND, item.N_BOOKING, balance: balanceB)
    }
    
    public func getDataInventoryTable() -> [InventoryTableModel] {
        return self.listInventoryTable
    }
    
    func getDataInventoryFooter() -> (Double, Double, Double) {
        
        guard let item = self.getDataProductInfo2() else { return (0, 0, 0) }
        
        let qtyA: Double = (item.QTYA_ONHAND ?? 0)
        let qtyB: Double = (item.QTYB_ONHAND ?? 0)
        let qtyC: Double = (item.QTYC_ONHAND ?? 0)
        let qtyD: Double = (item.QTYD_ONHAND ?? 0)
        let qtyE: Double = (item.QTYE_ONHAND ?? 0)
        let qtyF: Double = (item.QTYF_ONHAND ?? 0)
        let qtyG: Double = (item.QTYG_ONHAND ?? 0)
        let qtyI: Double = (item.QTYI_ONHAND ?? 0)
        let qtyJ: Double = (item.QTYJ_ONHAND ?? 0)
        let qtyK: Double = (item.QTYK_ONHAND ?? 0)
        let qtyL: Double = (item.QTYL_ONHAND ?? 0)
        let qtyM: Double = (item.QTYM_ONHAND ?? 0)
        let qtyN: Double = (item.QTYN_ONHAND ?? 0)
        
        let bookingA: Double = (item.A_BOOKING ?? 0)
        let bookingB: Double = (item.B_BOOKING ?? 0)
        let bookingC: Double = (item.C_BOOKING ?? 0)
        let bookingD: Double = (item.D_BOOKING ?? 0)
        let bookingE: Double = (item.E_BOOKING ?? 0)
        let bookingF: Double = (item.F_BOOKING ?? 0)
        let bookingG: Double = (item.G_BOOKING ?? 0)
        let bookingI: Double = (item.I_BOOKING ?? 0)
        let bookingJ: Double = (item.J_BOOKING ?? 0)
        let bookingK: Double = (item.K_BOOKING ?? 0)
        let bookingL: Double = (item.L_BOOKING ?? 0)
        let bookingM: Double = (item.M_BOOKING ?? 0)
        let bookingN: Double = (item.N_BOOKING ?? 0)
        
        let balanceA: Double = (item.QTYA_ONHAND ?? 0) + (item.A_BOOKING ?? 0)
        let balanceB: Double = (item.QTYB_ONHAND ?? 0) + (item.B_BOOKING ?? 0)
        let balanceC: Double = (item.QTYC_ONHAND ?? 0) + (item.C_BOOKING ?? 0)
        let balanceD: Double = (item.QTYD_ONHAND ?? 0) + (item.D_BOOKING ?? 0)
        let balanceE: Double = (item.QTYE_ONHAND ?? 0) + (item.E_BOOKING ?? 0)
        let balanceF: Double = (item.QTYF_ONHAND ?? 0) + (item.F_BOOKING ?? 0)
        let balanceG: Double = (item.QTYG_ONHAND ?? 0) + (item.G_BOOKING ?? 0)
        let balanceI: Double = (item.QTYI_ONHAND ?? 0) + (item.I_BOOKING ?? 0)
        let balanceJ: Double = (item.QTYJ_ONHAND ?? 0) + (item.J_BOOKING ?? 0)
        let balanceK: Double = (item.QTYK_ONHAND ?? 0) + (item.K_BOOKING ?? 0)
        let balanceL: Double = (item.QTYL_ONHAND ?? 0) + (item.L_BOOKING ?? 0)
        let balanceM: Double = (item.QTYM_ONHAND ?? 0) + (item.M_BOOKING ?? 0)
        let balanceN: Double = (item.QTYN_ONHAND ?? 0) + (item.N_BOOKING ?? 0)
        
        let qtyAll: Double = qtyA + qtyB + qtyC + qtyD + qtyE + qtyF + qtyG + qtyI + qtyJ + qtyK + qtyL + qtyM + qtyN
        
        let balanceAll: Double = balanceA + balanceB + balanceC + balanceD + balanceE + balanceF + balanceG + balanceI + balanceJ + balanceK + balanceL + balanceM + balanceN
        
        let bookingAll: Double = bookingA + bookingB + bookingC + bookingD + bookingE + bookingF + bookingG + bookingI + bookingJ + bookingK + bookingL + bookingM + bookingN
        
        return (qtyAll,bookingAll,balanceAll)
    }
    
    private func setItemInventoryTable(_ key: String, _ title: String, _ onhand: Double?, _ booking: Double?, balance: Double) {
        listInventoryTable.append(InventoryTableModel(key: key, location: title, onhand: "\(onhand ?? 0)", booking: "\(booking ?? 0)", balance: "\(balance)"))
    }
}

